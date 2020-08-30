//
//  CurrencyUsecase.swift
//  Currency Con
//
//  Created by Nemanja Stosic on 29/08/2020.
//  Copyright © 2020 No Scope Code. All rights reserved.
//

import Foundation
import RxSwift
import Resolver

protocol CurrencyUsecase {
    func fetchAvailableCurrencies() -> Observable<[Currency]>
    func fetchQuotes(_ currency: Currency) -> Observable<[Quote]>
}

class CurrencyUsecaseImpl : CurrencyUsecase {
    @Injected private var api: APIClient
    @Injected private var storage: CurrencyStorage
    
    private func fetchAvailableCurrenciesFromApi() -> Observable<[Currency]> {
        return api.getSupportedCurrencies().map { [unowned self] (supportedCurrenciesResponse) -> [Currency] in
            var currencies = [Currency]()
            supportedCurrenciesResponse.currencies.forEach { (isoCode, name) in
                currencies.append(Currency(isoCode: isoCode, name: name))
            }
            self.storage.persistCurrencyList(currencies)
            return currencies
        }
    }
    
    private func fetchAvailableCurrenciesFromStorage() -> Observable<[Currency]> {
        if let currencies = storage.fetchCurrencyList() {
            return Observable.just(currencies)
        }
        return Observable.empty()
    }
    
    func fetchAvailableCurrencies() -> Observable<[Currency]> {
        return fetchAvailableCurrenciesFromStorage().ifEmpty(switchTo: fetchAvailableCurrenciesFromApi())
    }
    
    private func fetchQuotesFromApi() -> Observable<[Quote]> {
        return api.getCurrencyQuotes()
            .map { [unowned self] (quotesResponse) -> [Quote] in
                var quotes = [Quote]()
                quotesResponse.quotes.forEach { (conversion, rate) in
                    let from = conversion[..<conversion.index(conversion.startIndex, offsetBy: 3)]
                    let to = conversion[conversion.index(conversion.startIndex, offsetBy: 3)...]
                    quotes.append(Quote(from: Currency(isoCode: String(from), name: ""), to: Currency(isoCode: String(to), name: ""), rate: rate))
                }
                self.storage.persistQuotes(quotesResponse.source, quotes: quotes, timestamp: Double(quotesResponse.timestamp))
                return quotes
        }
    }
    
    private func fetchQuotesFromStorage() -> Observable<[Quote]> {
        do {
            if let quotes = try storage.fetchQuotes("USD", force: false) {
                return Observable.just(quotes)
            }
        } catch is CacheDataExpiredException {
            
        } catch {
            debugPrint("Unknown exception occurred in fetchQuotesFromStorage")
        }
        return Observable.empty()
    }
    
    func fetchQuotes(_ currency: Currency) -> Observable<[Quote]> {
        return fetchQuotesFromStorage().ifEmpty(switchTo: fetchQuotesFromApi()).map { (usdQuotes) -> [Quote] in
            var quotes = [Quote]()
            if let baseQuote = usdQuotes.first(where: { $0.to == currency }) {
                usdQuotes.forEach { (quote) in
                    let adjustedQuote = Quote(from: currency, to: quote.to, rate: quote.rate / baseQuote.rate)
                    quotes.append(adjustedQuote)
                }
            }
            return quotes
        }
    }
}
