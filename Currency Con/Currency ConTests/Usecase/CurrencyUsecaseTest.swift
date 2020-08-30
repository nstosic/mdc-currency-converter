//
//  CurrencyUsecaseTest.swift
//  Currency ConTests
//
//  Created by Nemanja Stosic on 30/08/2020.
//  Copyright © 2020 No Scope Code. All rights reserved.
//

import Foundation
import XCTest
import Cuckoo
import Resolver
import RxBlocking
import RxSwift

// Currencies
let mockedCachedCurrencyList = [Currency(isoCode: "JPY", name: "Japanese Yen")]
let mockedApiCurrencyResponse = SupportedCurrenciesResponse(success: true, currencies: ["USD" : "United States Dollar"])
let expectedApiCurrencyList = [Currency(isoCode: "USD", name: "United States Dollar")]

// Quotes
let mockedCachedQuotes = [
    Quote(from: Currency(isoCode: "USD", name: ""), to: Currency(isoCode: "RSD", name: ""), rate: 100.12),
    Quote(from: Currency(isoCode: "USD", name: ""), to: Currency(isoCode: "JPY", name: ""), rate: 105.43)
]
let mockedApiQuotesResponse = QuotesResponse(success: true, source: "USD", quotes: ["USDRSD" : 100.12, "USDJPY" : 105.43], timestamp: 123456789)
let expectedQuotes = [
    Quote(from: Currency(isoCode: "JPY", name: ""), to: Currency(isoCode: "JPY", name: ""), rate: 1.0),
    Quote(from: Currency(isoCode: "JPY", name: ""), to: Currency(isoCode: "RSD", name: ""), rate: 100.12 / 105.43)
]

class CurrencyUsecaseTest: XCTestCase {
    
    private var mockedApiClient: MockAPIClient?
    private var mockedStorage: MockCurrencyStorage?
    private var softwareUnderTest: CurrencyUsecase?
    
    override func setUp() {
        // Register mocks
        mockedApiClient = MockAPIClient()
        mockedStorage = MockCurrencyStorage()
        Resolver.register { self.mockedApiClient! as APIClient }
        Resolver.register { self.mockedStorage! as CurrencyStorage }
        
        // Default stubbing
        stub(mockedApiClient!) { stub in
            when(stub).getSupportedCurrencies().thenReturn(Observable.empty())
            when(stub).getCurrencyQuotes().thenReturn(Observable.empty())
        }
        stub(mockedStorage!) { stub in
            when(stub).fetchCurrencyList().thenReturn(nil)
            when(stub).fetchQuotes(any(), force: false).thenReturn(nil)
            when(stub).persistCurrencyList(any()).thenDoNothing()
            when(stub).persistQuotes(any(), quotes: any(), timestamp: any()).thenDoNothing()
        }
        
        softwareUnderTest = CurrencyUsecaseImpl()
    }
    
    override class func tearDown() {
        
    }
    
    func testWhenThereIsNoCachedDataFetchAvailableCurrenciesSendsRequestToAPI() {
        // Setup
        stub(mockedApiClient!) { stub in
            when(stub).getSupportedCurrencies().thenReturn(Observable.just(mockedApiCurrencyResponse))
        }
        
        // Execution
        let result = try! softwareUnderTest?.fetchAvailableCurrencies().toBlocking().toArray()
        
        // Verification
        XCTAssertEqual(result?.count, 1)
        XCTAssertEqual(result?.first, expectedApiCurrencyList)
    }
    
    func testWhenThereIsCachedDataFetchAvailableCurrenciesDoesNotSendRequestToAPI() {
        // Setup
        stub(mockedStorage!) { stub in
            when(stub).fetchCurrencyList().thenReturn(mockedCachedCurrencyList)
        }
        
        // Execution
        let result = try! softwareUnderTest?.fetchAvailableCurrencies().toBlocking().toArray()
        
        // Verification
        XCTAssertEqual(result?.count, 1)
        XCTAssertEqual(result?.first, mockedCachedCurrencyList)
    }
    
    func testWhenAPIReturnsSupportedCurrenciesResponseItIsCached() {
        // Setup
        stub(mockedApiClient!) { stub in
            when(stub).getSupportedCurrencies().thenReturn(Observable.just(mockedApiCurrencyResponse))
        }
        
        // Execution
        _ = softwareUnderTest?.fetchAvailableCurrencies().toBlocking().materialize()
        
        // Verification
        verify(mockedStorage!).persistCurrencyList(equal(to: expectedApiCurrencyList))
    }
    
    func testWhenThereIsNoCachedDataForSelectedCurrencyFetchQuotesSendsRequestToAPI() {
        // Setup
        stub(mockedApiClient!) { stub in
            when(stub).getCurrencyQuotes().thenReturn(Observable.just(mockedApiQuotesResponse))
        }
        
        // Execution
        let result = try! softwareUnderTest?.fetchQuotes(Currency(isoCode: "JPY", name: "Japanese Yen")).toBlocking().toArray()
        
        // Verification
        XCTAssertEqual(result?.count, 1)
        XCTAssertEqual(result?.first?.sorted(by: { $0.to.isoCode < $1.to.isoCode }), expectedQuotes.sorted(by: { $0.to.isoCode < $1.to.isoCode }))
    }
    
    func testWhenThereIsCachedDataFetchQuotesDoesNotSendRequesToAPI() {
        // Setup
        stub(mockedStorage!) { stub in
            when(stub).fetchQuotes(equal(to: "USD"), force: equal(to: false)).thenReturn(mockedCachedQuotes)
        }
        
        // Execution
        let result = try! softwareUnderTest?.fetchQuotes(Currency(isoCode: "JPY", name: "Japanese Yen")).toBlocking().toArray()
        
        // Verification
        XCTAssertEqual(result?.count, 1)
        XCTAssertEqual(result?.first?.sorted(by: { $0.to.isoCode < $1.to.isoCode }), expectedQuotes.sorted(by: { $0.to.isoCode < $1.to.isoCode }))
    }
    
    func testWhenAPIReturnsQuotesResponseItIsCached() {
        // Setup
        stub(mockedApiClient!) { stub in
            when(stub).getCurrencyQuotes().thenReturn(Observable.just(mockedApiQuotesResponse))
        }
        
        // Execution
        _ = softwareUnderTest?.fetchQuotes(Currency(isoCode: "JPY", name: "Japanese Yen")).toBlocking().materialize()
        
        // Verification
        verify(mockedStorage!).persistQuotes(equal(to: "USD"), quotes: any(), timestamp: 123456789)
    }
}
