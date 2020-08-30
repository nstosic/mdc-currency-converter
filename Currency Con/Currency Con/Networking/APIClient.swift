//
//  APIClient.swift
//  Currency Con
//
//  Created by Nemanja Stosic on 29/08/2020.
//  Copyright © 2020 No Scope Code. All rights reserved.
//

import Foundation
import RxSwift
import Resolver

protocol APIClient {
    func getSupportedCurrencies() -> Observable<SupportedCurrenciesResponse>
    func getCurrencyQuotes(_ currency: String) -> Observable<QuotesResponse>
}

class APIClientImpl : APIClient {
    @Injected var networkingClient: NetworkingClient
    
    func getSupportedCurrencies() -> Observable<SupportedCurrenciesResponse> {
        return networkingClient.request(url: APIRoutes.list, method: .get, parameters: nil, headers: nil)
    }
    
    func getCurrencyQuotes(_ currency: String) -> Observable<QuotesResponse> {
        return networkingClient.request(url: APIRoutes.live, method: .get, parameters: nil, headers: nil)
    }
}
