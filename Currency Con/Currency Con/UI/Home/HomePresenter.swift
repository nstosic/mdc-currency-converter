//
//  HomePresenter.swift
//  Currency Con
//
//  Created by Nemanja Stosic on 29/08/2020.
//  Copyright © 2020 No Scope Code. All rights reserved.
//

import Foundation
import Resolver
import RxSwift

protocol HomePresenter: BasePresenter {
    func loadCurrencies(success: @escaping ([Currency]) -> Void, failure: @escaping (Error) -> Void)
    func loadQuotes(_ currency: Currency, success: @escaping ([Quote]) -> Void, failure: @escaping (Error) -> Void)
}

class HomePresenterImpl: HomePresenter {
    var disposeBag: DisposeBag = DisposeBag()
    @Injected private var currencyUsecase: CurrencyUsecase
    
    func loadCurrencies(success: @escaping ([Currency]) -> Void, failure: @escaping (Error) -> Void) {
        currencyUsecase.fetchAvailableCurrencies().subscribe { (event) in
            switch event {
            case .next(let data):
                success(data)
            case .error(let exception):
                failure(exception)
            case .completed:
                print("No more items to emit from fetchAvailableCurrencies()")
            }
        }.disposed(by: disposeBag)
    }
    
    func loadQuotes(_ currency: Currency, success: @escaping ([Quote]) -> Void, failure: @escaping (Error) -> Void) {
        currencyUsecase.fetchQuotes(currency).subscribe { (event) in
            switch event {
            case .next(let data):
                success(data)
            case .error(let exception):
                failure(exception)
            case .completed:
                print("No more items to emit from fetchQuotes()")
            }
        }.disposed(by: disposeBag)
    }
}
