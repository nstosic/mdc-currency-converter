//
//  CurrencyStorage.swift
//  Currency Con
//
//  Created by Nemanja Stosic on 29/08/2020.
//  Copyright © 2020 No Scope Code. All rights reserved.
//

import Foundation

fileprivate class StorageKeys {
    static let supportedCurrencies = "SupportedCurrencies"
    static let quoteFor = "QuoteFor"
    static let timestampFor = "TimestampFor"
}

protocol CurrencyStorage {
    func persistCurrencyList(_ supportedCurrencies: [Currency])
    func fetchCurrencyList() -> [Currency]?
    func persistQuotes(_ currency: String, quotes: [Quote], timestamp: Double)
    func fetchQuotes(_ currency: String, force: Bool) throws -> [Quote]?
}

class CurrencyStorageImpl: CurrencyStorage {
    private let storage = UserDefaults()
    private let encoder = PropertyListEncoder()
    private let decoder = PropertyListDecoder()
    
    func persistCurrencyList(_ supportedCurrencies: [Currency]) {
        do {
            storage.set(try supportedCurrencies.map { try encoder.encode($0) }, forKey: StorageKeys.supportedCurrencies)
        } catch {
            print("Caching of \(supportedCurrencies) failed")
        }
    }
    
    func fetchCurrencyList() -> [Currency]? {
        do {
            guard let cachedData = storage.array(forKey: StorageKeys.supportedCurrencies) as? [Data] else {
                return nil
            }
            return try cachedData.map { try decoder.decode(Currency.self, from: $0) }
        } catch {
            return nil
        }
    }
    
    func persistQuotes(_ currency: String, quotes: [Quote], timestamp: Double) {
        do {
            let currencyKey = "\(StorageKeys.quoteFor)\(currency)"
            let timestampKey = "\(StorageKeys.timestampFor)\(currency)"
            storage.set(try quotes.map { try encoder.encode($0) }, forKey: currencyKey)
            storage.set(timestamp, forKey: timestampKey)
        } catch {
            print("Caching of \(quotes) failed")
        }
    }
    
    func fetchQuotes(_ currency: String, force: Bool) throws -> [Quote]? {
        let currencyKey = "\(StorageKeys.quoteFor)\(currency)"
        let timestampKey = "\(StorageKeys.timestampFor)\(currency)"
        guard let cachedData = storage.array(forKey: currencyKey) as? [Data] else {
            return nil
        }
        let timestamp = storage.double(forKey: timestampKey)
        let now = (Date().timeIntervalSince1970 as Double)
        if (force || now - timestamp <= Constants.timeBeforeExpiryInSeconds) {
            do {
                return try cachedData.map { try decoder.decode(Quote.self, from: $0) }
            } catch {
                return nil
            }
        }
        throw CacheDataExpiredException()
    }
}
