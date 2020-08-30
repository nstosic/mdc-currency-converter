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
let mockedApiCurrencyResponse = SupportedCurrenciesResponse(success: true, currencies: ["RSD" : "Serbian Dinar"])
let expectedApiCurrencyList = [Currency(isoCode: "RSD", name: "Serbian Dinar")]

// Quotes
let mockedCachedQuotes = [Quote(from: Currency(isoCode: "JPY", name: ""), to: Currency(isoCode: "RSD", name: ""), rate: 1.11)]
let mockedApiQuotesResponse = QuotesResponse(success: true, source: "JPY", quotes: ["JPYRSD" : 1.1], timestamp: 123456789)
let expectedApiQuotes = [Quote(from: Currency(isoCode: "JPY", name: ""), to: Currency(isoCode: "RSD", name: ""), rate: 1.1)]

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
            when(stub).getCurrencyQuotes(any()).thenReturn(Observable.empty())
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
            when(stub).getCurrencyQuotes(equal(to: "JPY")).thenReturn(Observable.just(mockedApiQuotesResponse))
        }
        
        // Execution
        let result = try! softwareUnderTest?.fetchQuotes(Currency(isoCode: "JPY", name: "Japanese Yen")).toBlocking().toArray()
        
        // Verification
        XCTAssertEqual(result?.count, 1)
        XCTAssertEqual(result?.first, expectedApiQuotes)
    }
    
    func testWhenThereIsCachedDataFetchQuotesDoesNotSendRequesToAPI() {
        // Setup
        stub(mockedStorage!) { stub in
            when(stub).fetchQuotes(equal(to: "JPY"), force: equal(to: false)).thenReturn(mockedCachedQuotes)
        }
        
        // Execution
        let result = try! softwareUnderTest?.fetchQuotes(Currency(isoCode: "JPY", name: "Japanese Yen")).toBlocking().toArray()
        
        // Verification
        XCTAssertEqual(result?.count, 1)
        XCTAssertEqual(result?.first, mockedCachedQuotes)
    }
    
    func testWhenAPIReturnsQuotesResponseItIsCached() {
        // Setup
        stub(mockedApiClient!) { stub in
            when(stub).getCurrencyQuotes(equal(to: "JPY")).thenReturn(Observable.just(mockedApiQuotesResponse))
        }
        
        // Execution
        _ = softwareUnderTest?.fetchQuotes(Currency(isoCode: "JPY", name: "Japanese Yen")).toBlocking().materialize()
        
        // Verification
        verify(mockedStorage!).persistQuotes(equal(to: "JPY"), quotes: equal(to: expectedApiQuotes), timestamp: 123456789)
    }
}
