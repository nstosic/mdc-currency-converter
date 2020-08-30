// MARK: - Mocks generated from file: Currency Con/Networking/APIClient.swift at 2020-08-30 17:10:18 +0000

//
//  APIClient.swift
//  Currency Con
//
//  Created by Nemanja Stosic on 29/08/2020.
//  Copyright © 2020 No Scope Code. All rights reserved.
//

import Cuckoo
@testable import Currency_Con

import Foundation
import Resolver
import RxSwift


 class MockAPIClient: APIClient, Cuckoo.ProtocolMock {
    
     typealias MocksType = APIClient
    
     typealias Stubbing = __StubbingProxy_APIClient
     typealias Verification = __VerificationProxy_APIClient

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: APIClient?

     func enableDefaultImplementation(_ stub: APIClient) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func getSupportedCurrencies() -> Observable<SupportedCurrenciesResponse> {
        
    return cuckoo_manager.call("getSupportedCurrencies() -> Observable<SupportedCurrenciesResponse>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getSupportedCurrencies())
        
    }
    
    
    
     func getCurrencyQuotes(_ currency: String) -> Observable<QuotesResponse> {
        
    return cuckoo_manager.call("getCurrencyQuotes(_: String) -> Observable<QuotesResponse>",
            parameters: (currency),
            escapingParameters: (currency),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getCurrencyQuotes(currency))
        
    }
    

	 struct __StubbingProxy_APIClient: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getSupportedCurrencies() -> Cuckoo.ProtocolStubFunction<(), Observable<SupportedCurrenciesResponse>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockAPIClient.self, method: "getSupportedCurrencies() -> Observable<SupportedCurrenciesResponse>", parameterMatchers: matchers))
	    }
	    
	    func getCurrencyQuotes<M1: Cuckoo.Matchable>(_ currency: M1) -> Cuckoo.ProtocolStubFunction<(String), Observable<QuotesResponse>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: currency) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockAPIClient.self, method: "getCurrencyQuotes(_: String) -> Observable<QuotesResponse>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_APIClient: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getSupportedCurrencies() -> Cuckoo.__DoNotUse<(), Observable<SupportedCurrenciesResponse>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getSupportedCurrencies() -> Observable<SupportedCurrenciesResponse>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getCurrencyQuotes<M1: Cuckoo.Matchable>(_ currency: M1) -> Cuckoo.__DoNotUse<(String), Observable<QuotesResponse>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: currency) { $0 }]
	        return cuckoo_manager.verify("getCurrencyQuotes(_: String) -> Observable<QuotesResponse>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class APIClientStub: APIClient {
    

    

    
     func getSupportedCurrencies() -> Observable<SupportedCurrenciesResponse>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<SupportedCurrenciesResponse>).self)
    }
    
     func getCurrencyQuotes(_ currency: String) -> Observable<QuotesResponse>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<QuotesResponse>).self)
    }
    
}



 class MockAPIClientImpl: APIClientImpl, Cuckoo.ClassMock {
    
     typealias MocksType = APIClientImpl
    
     typealias Stubbing = __StubbingProxy_APIClientImpl
     typealias Verification = __VerificationProxy_APIClientImpl

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: APIClientImpl?

     func enableDefaultImplementation(_ stub: APIClientImpl) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var networkingClient: NetworkingClient {
        get {
            return cuckoo_manager.getter("networkingClient",
                superclassCall:
                    
                    super.networkingClient
                    ,
                defaultCall: __defaultImplStub!.networkingClient)
        }
        
        set {
            cuckoo_manager.setter("networkingClient",
                value: newValue,
                superclassCall:
                    
                    super.networkingClient = newValue
                    ,
                defaultCall: __defaultImplStub!.networkingClient = newValue)
        }
        
    }
    

    

    
    
    
     override func getSupportedCurrencies() -> Observable<SupportedCurrenciesResponse> {
        
    return cuckoo_manager.call("getSupportedCurrencies() -> Observable<SupportedCurrenciesResponse>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.getSupportedCurrencies()
                ,
            defaultCall: __defaultImplStub!.getSupportedCurrencies())
        
    }
    
    
    
     override func getCurrencyQuotes(_ currency: String) -> Observable<QuotesResponse> {
        
    return cuckoo_manager.call("getCurrencyQuotes(_: String) -> Observable<QuotesResponse>",
            parameters: (currency),
            escapingParameters: (currency),
            superclassCall:
                
                super.getCurrencyQuotes(currency)
                ,
            defaultCall: __defaultImplStub!.getCurrencyQuotes(currency))
        
    }
    

	 struct __StubbingProxy_APIClientImpl: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var networkingClient: Cuckoo.ClassToBeStubbedProperty<MockAPIClientImpl, NetworkingClient> {
	        return .init(manager: cuckoo_manager, name: "networkingClient")
	    }
	    
	    
	    func getSupportedCurrencies() -> Cuckoo.ClassStubFunction<(), Observable<SupportedCurrenciesResponse>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockAPIClientImpl.self, method: "getSupportedCurrencies() -> Observable<SupportedCurrenciesResponse>", parameterMatchers: matchers))
	    }
	    
	    func getCurrencyQuotes<M1: Cuckoo.Matchable>(_ currency: M1) -> Cuckoo.ClassStubFunction<(String), Observable<QuotesResponse>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: currency) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockAPIClientImpl.self, method: "getCurrencyQuotes(_: String) -> Observable<QuotesResponse>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_APIClientImpl: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var networkingClient: Cuckoo.VerifyProperty<NetworkingClient> {
	        return .init(manager: cuckoo_manager, name: "networkingClient", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func getSupportedCurrencies() -> Cuckoo.__DoNotUse<(), Observable<SupportedCurrenciesResponse>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getSupportedCurrencies() -> Observable<SupportedCurrenciesResponse>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func getCurrencyQuotes<M1: Cuckoo.Matchable>(_ currency: M1) -> Cuckoo.__DoNotUse<(String), Observable<QuotesResponse>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: currency) { $0 }]
	        return cuckoo_manager.verify("getCurrencyQuotes(_: String) -> Observable<QuotesResponse>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class APIClientImplStub: APIClientImpl {
    
    
     override var networkingClient: NetworkingClient {
        get {
            return DefaultValueRegistry.defaultValue(for: (NetworkingClient).self)
        }
        
        set { }
        
    }
    

    

    
     override func getSupportedCurrencies() -> Observable<SupportedCurrenciesResponse>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<SupportedCurrenciesResponse>).self)
    }
    
     override func getCurrencyQuotes(_ currency: String) -> Observable<QuotesResponse>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<QuotesResponse>).self)
    }
    
}


// MARK: - Mocks generated from file: Currency Con/Networking/NetworkingClient.swift at 2020-08-30 17:10:18 +0000

//
//  NetworkingClient.swift
//  Currency Con
//
//  Created by Nemanja Stosic on 29/08/2020.
//  Copyright © 2020 No Scope Code. All rights reserved.
//

import Cuckoo
@testable import Currency_Con

import Alamofire
import Foundation
import RxAlamofire
import RxSwift


 class MockNetworkingClient: NetworkingClient, Cuckoo.ProtocolMock {
    
     typealias MocksType = NetworkingClient
    
     typealias Stubbing = __StubbingProxy_NetworkingClient
     typealias Verification = __VerificationProxy_NetworkingClient

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: NetworkingClient?

     func enableDefaultImplementation(_ stub: NetworkingClient) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func request<T: BaseModel>(url: URLConvertible, method: HTTPMethod, parameters: [String : Any]?, headers: [String : String]?) -> Observable<T> {
        
    return cuckoo_manager.call("request(url: URLConvertible, method: HTTPMethod, parameters: [String : Any]?, headers: [String : String]?) -> Observable<T>",
            parameters: (url, method, parameters, headers),
            escapingParameters: (url, method, parameters, headers),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.request(url: url, method: method, parameters: parameters, headers: headers))
        
    }
    

	 struct __StubbingProxy_NetworkingClient: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func request<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.OptionalMatchable, M4: Cuckoo.OptionalMatchable, T: BaseModel>(url: M1, method: M2, parameters: M3, headers: M4) -> Cuckoo.ProtocolStubFunction<(URLConvertible, HTTPMethod, [String : Any]?, [String : String]?), Observable<T>> where M1.MatchedType == URLConvertible, M2.MatchedType == HTTPMethod, M3.OptionalMatchedType == [String : Any], M4.OptionalMatchedType == [String : String] {
	        let matchers: [Cuckoo.ParameterMatcher<(URLConvertible, HTTPMethod, [String : Any]?, [String : String]?)>] = [wrap(matchable: url) { $0.0 }, wrap(matchable: method) { $0.1 }, wrap(matchable: parameters) { $0.2 }, wrap(matchable: headers) { $0.3 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockNetworkingClient.self, method: "request(url: URLConvertible, method: HTTPMethod, parameters: [String : Any]?, headers: [String : String]?) -> Observable<T>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_NetworkingClient: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func request<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.OptionalMatchable, M4: Cuckoo.OptionalMatchable, T: BaseModel>(url: M1, method: M2, parameters: M3, headers: M4) -> Cuckoo.__DoNotUse<(URLConvertible, HTTPMethod, [String : Any]?, [String : String]?), Observable<T>> where M1.MatchedType == URLConvertible, M2.MatchedType == HTTPMethod, M3.OptionalMatchedType == [String : Any], M4.OptionalMatchedType == [String : String] {
	        let matchers: [Cuckoo.ParameterMatcher<(URLConvertible, HTTPMethod, [String : Any]?, [String : String]?)>] = [wrap(matchable: url) { $0.0 }, wrap(matchable: method) { $0.1 }, wrap(matchable: parameters) { $0.2 }, wrap(matchable: headers) { $0.3 }]
	        return cuckoo_manager.verify("request(url: URLConvertible, method: HTTPMethod, parameters: [String : Any]?, headers: [String : String]?) -> Observable<T>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class NetworkingClientStub: NetworkingClient {
    

    

    
     func request<T: BaseModel>(url: URLConvertible, method: HTTPMethod, parameters: [String : Any]?, headers: [String : String]?) -> Observable<T>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<T>).self)
    }
    
}



 class MockNetworkingClientImpl: NetworkingClientImpl, Cuckoo.ClassMock {
    
     typealias MocksType = NetworkingClientImpl
    
     typealias Stubbing = __StubbingProxy_NetworkingClientImpl
     typealias Verification = __VerificationProxy_NetworkingClientImpl

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: NetworkingClientImpl?

     func enableDefaultImplementation(_ stub: NetworkingClientImpl) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func request<T: BaseModel>(url: URLConvertible, method: HTTPMethod, parameters: [String : Any]?, headers: [String : String]?) -> Observable<T> {
        
    return cuckoo_manager.call("request(url: URLConvertible, method: HTTPMethod, parameters: [String : Any]?, headers: [String : String]?) -> Observable<T>",
            parameters: (url, method, parameters, headers),
            escapingParameters: (url, method, parameters, headers),
            superclassCall:
                
                super.request(url: url, method: method, parameters: parameters, headers: headers)
                ,
            defaultCall: __defaultImplStub!.request(url: url, method: method, parameters: parameters, headers: headers))
        
    }
    

	 struct __StubbingProxy_NetworkingClientImpl: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func request<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.OptionalMatchable, M4: Cuckoo.OptionalMatchable, T: BaseModel>(url: M1, method: M2, parameters: M3, headers: M4) -> Cuckoo.ClassStubFunction<(URLConvertible, HTTPMethod, [String : Any]?, [String : String]?), Observable<T>> where M1.MatchedType == URLConvertible, M2.MatchedType == HTTPMethod, M3.OptionalMatchedType == [String : Any], M4.OptionalMatchedType == [String : String] {
	        let matchers: [Cuckoo.ParameterMatcher<(URLConvertible, HTTPMethod, [String : Any]?, [String : String]?)>] = [wrap(matchable: url) { $0.0 }, wrap(matchable: method) { $0.1 }, wrap(matchable: parameters) { $0.2 }, wrap(matchable: headers) { $0.3 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockNetworkingClientImpl.self, method: "request(url: URLConvertible, method: HTTPMethod, parameters: [String : Any]?, headers: [String : String]?) -> Observable<T>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_NetworkingClientImpl: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func request<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.OptionalMatchable, M4: Cuckoo.OptionalMatchable, T: BaseModel>(url: M1, method: M2, parameters: M3, headers: M4) -> Cuckoo.__DoNotUse<(URLConvertible, HTTPMethod, [String : Any]?, [String : String]?), Observable<T>> where M1.MatchedType == URLConvertible, M2.MatchedType == HTTPMethod, M3.OptionalMatchedType == [String : Any], M4.OptionalMatchedType == [String : String] {
	        let matchers: [Cuckoo.ParameterMatcher<(URLConvertible, HTTPMethod, [String : Any]?, [String : String]?)>] = [wrap(matchable: url) { $0.0 }, wrap(matchable: method) { $0.1 }, wrap(matchable: parameters) { $0.2 }, wrap(matchable: headers) { $0.3 }]
	        return cuckoo_manager.verify("request(url: URLConvertible, method: HTTPMethod, parameters: [String : Any]?, headers: [String : String]?) -> Observable<T>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class NetworkingClientImplStub: NetworkingClientImpl {
    

    

    
     override func request<T: BaseModel>(url: URLConvertible, method: HTTPMethod, parameters: [String : Any]?, headers: [String : String]?) -> Observable<T>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<T>).self)
    }
    
}


// MARK: - Mocks generated from file: Currency Con/Storage/CurrencyStorage.swift at 2020-08-30 17:10:18 +0000

//
//  CurrencyStorage.swift
//  Currency Con
//
//  Created by Nemanja Stosic on 29/08/2020.
//  Copyright © 2020 No Scope Code. All rights reserved.
//

import Cuckoo
@testable import Currency_Con

import Foundation


 class MockCurrencyStorage: CurrencyStorage, Cuckoo.ProtocolMock {
    
     typealias MocksType = CurrencyStorage
    
     typealias Stubbing = __StubbingProxy_CurrencyStorage
     typealias Verification = __VerificationProxy_CurrencyStorage

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: CurrencyStorage?

     func enableDefaultImplementation(_ stub: CurrencyStorage) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func persistCurrencyList(_ supportedCurrencies: [Currency])  {
        
    return cuckoo_manager.call("persistCurrencyList(_: [Currency])",
            parameters: (supportedCurrencies),
            escapingParameters: (supportedCurrencies),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.persistCurrencyList(supportedCurrencies))
        
    }
    
    
    
     func fetchCurrencyList() -> [Currency]? {
        
    return cuckoo_manager.call("fetchCurrencyList() -> [Currency]?",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.fetchCurrencyList())
        
    }
    
    
    
     func persistQuotes(_ currency: String, quotes: [Quote], timestamp: Double)  {
        
    return cuckoo_manager.call("persistQuotes(_: String, quotes: [Quote], timestamp: Double)",
            parameters: (currency, quotes, timestamp),
            escapingParameters: (currency, quotes, timestamp),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.persistQuotes(currency, quotes: quotes, timestamp: timestamp))
        
    }
    
    
    
     func fetchQuotes(_ currency: String, force: Bool) throws -> [Quote]? {
        
    return try cuckoo_manager.callThrows("fetchQuotes(_: String, force: Bool) throws -> [Quote]?",
            parameters: (currency, force),
            escapingParameters: (currency, force),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.fetchQuotes(currency, force: force))
        
    }
    

	 struct __StubbingProxy_CurrencyStorage: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func persistCurrencyList<M1: Cuckoo.Matchable>(_ supportedCurrencies: M1) -> Cuckoo.ProtocolStubNoReturnFunction<([Currency])> where M1.MatchedType == [Currency] {
	        let matchers: [Cuckoo.ParameterMatcher<([Currency])>] = [wrap(matchable: supportedCurrencies) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockCurrencyStorage.self, method: "persistCurrencyList(_: [Currency])", parameterMatchers: matchers))
	    }
	    
	    func fetchCurrencyList() -> Cuckoo.ProtocolStubFunction<(), [Currency]?> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockCurrencyStorage.self, method: "fetchCurrencyList() -> [Currency]?", parameterMatchers: matchers))
	    }
	    
	    func persistQuotes<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(_ currency: M1, quotes: M2, timestamp: M3) -> Cuckoo.ProtocolStubNoReturnFunction<(String, [Quote], Double)> where M1.MatchedType == String, M2.MatchedType == [Quote], M3.MatchedType == Double {
	        let matchers: [Cuckoo.ParameterMatcher<(String, [Quote], Double)>] = [wrap(matchable: currency) { $0.0 }, wrap(matchable: quotes) { $0.1 }, wrap(matchable: timestamp) { $0.2 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockCurrencyStorage.self, method: "persistQuotes(_: String, quotes: [Quote], timestamp: Double)", parameterMatchers: matchers))
	    }
	    
	    func fetchQuotes<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ currency: M1, force: M2) -> Cuckoo.ProtocolStubThrowingFunction<(String, Bool), [Quote]?> where M1.MatchedType == String, M2.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(String, Bool)>] = [wrap(matchable: currency) { $0.0 }, wrap(matchable: force) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockCurrencyStorage.self, method: "fetchQuotes(_: String, force: Bool) throws -> [Quote]?", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_CurrencyStorage: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func persistCurrencyList<M1: Cuckoo.Matchable>(_ supportedCurrencies: M1) -> Cuckoo.__DoNotUse<([Currency]), Void> where M1.MatchedType == [Currency] {
	        let matchers: [Cuckoo.ParameterMatcher<([Currency])>] = [wrap(matchable: supportedCurrencies) { $0 }]
	        return cuckoo_manager.verify("persistCurrencyList(_: [Currency])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func fetchCurrencyList() -> Cuckoo.__DoNotUse<(), [Currency]?> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("fetchCurrencyList() -> [Currency]?", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func persistQuotes<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(_ currency: M1, quotes: M2, timestamp: M3) -> Cuckoo.__DoNotUse<(String, [Quote], Double), Void> where M1.MatchedType == String, M2.MatchedType == [Quote], M3.MatchedType == Double {
	        let matchers: [Cuckoo.ParameterMatcher<(String, [Quote], Double)>] = [wrap(matchable: currency) { $0.0 }, wrap(matchable: quotes) { $0.1 }, wrap(matchable: timestamp) { $0.2 }]
	        return cuckoo_manager.verify("persistQuotes(_: String, quotes: [Quote], timestamp: Double)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func fetchQuotes<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ currency: M1, force: M2) -> Cuckoo.__DoNotUse<(String, Bool), [Quote]?> where M1.MatchedType == String, M2.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(String, Bool)>] = [wrap(matchable: currency) { $0.0 }, wrap(matchable: force) { $0.1 }]
	        return cuckoo_manager.verify("fetchQuotes(_: String, force: Bool) throws -> [Quote]?", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class CurrencyStorageStub: CurrencyStorage {
    

    

    
     func persistCurrencyList(_ supportedCurrencies: [Currency])   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func fetchCurrencyList() -> [Currency]?  {
        return DefaultValueRegistry.defaultValue(for: ([Currency]?).self)
    }
    
     func persistQuotes(_ currency: String, quotes: [Quote], timestamp: Double)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func fetchQuotes(_ currency: String, force: Bool) throws -> [Quote]?  {
        return DefaultValueRegistry.defaultValue(for: ([Quote]?).self)
    }
    
}



 class MockCurrencyStorageImpl: CurrencyStorageImpl, Cuckoo.ClassMock {
    
     typealias MocksType = CurrencyStorageImpl
    
     typealias Stubbing = __StubbingProxy_CurrencyStorageImpl
     typealias Verification = __VerificationProxy_CurrencyStorageImpl

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: CurrencyStorageImpl?

     func enableDefaultImplementation(_ stub: CurrencyStorageImpl) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func persistCurrencyList(_ supportedCurrencies: [Currency])  {
        
    return cuckoo_manager.call("persistCurrencyList(_: [Currency])",
            parameters: (supportedCurrencies),
            escapingParameters: (supportedCurrencies),
            superclassCall:
                
                super.persistCurrencyList(supportedCurrencies)
                ,
            defaultCall: __defaultImplStub!.persistCurrencyList(supportedCurrencies))
        
    }
    
    
    
     override func fetchCurrencyList() -> [Currency]? {
        
    return cuckoo_manager.call("fetchCurrencyList() -> [Currency]?",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.fetchCurrencyList()
                ,
            defaultCall: __defaultImplStub!.fetchCurrencyList())
        
    }
    
    
    
     override func persistQuotes(_ currency: String, quotes: [Quote], timestamp: Double)  {
        
    return cuckoo_manager.call("persistQuotes(_: String, quotes: [Quote], timestamp: Double)",
            parameters: (currency, quotes, timestamp),
            escapingParameters: (currency, quotes, timestamp),
            superclassCall:
                
                super.persistQuotes(currency, quotes: quotes, timestamp: timestamp)
                ,
            defaultCall: __defaultImplStub!.persistQuotes(currency, quotes: quotes, timestamp: timestamp))
        
    }
    
    
    
     override func fetchQuotes(_ currency: String, force: Bool) throws -> [Quote]? {
        
    return try cuckoo_manager.callThrows("fetchQuotes(_: String, force: Bool) throws -> [Quote]?",
            parameters: (currency, force),
            escapingParameters: (currency, force),
            superclassCall:
                
                super.fetchQuotes(currency, force: force)
                ,
            defaultCall: __defaultImplStub!.fetchQuotes(currency, force: force))
        
    }
    

	 struct __StubbingProxy_CurrencyStorageImpl: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func persistCurrencyList<M1: Cuckoo.Matchable>(_ supportedCurrencies: M1) -> Cuckoo.ClassStubNoReturnFunction<([Currency])> where M1.MatchedType == [Currency] {
	        let matchers: [Cuckoo.ParameterMatcher<([Currency])>] = [wrap(matchable: supportedCurrencies) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockCurrencyStorageImpl.self, method: "persistCurrencyList(_: [Currency])", parameterMatchers: matchers))
	    }
	    
	    func fetchCurrencyList() -> Cuckoo.ClassStubFunction<(), [Currency]?> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockCurrencyStorageImpl.self, method: "fetchCurrencyList() -> [Currency]?", parameterMatchers: matchers))
	    }
	    
	    func persistQuotes<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(_ currency: M1, quotes: M2, timestamp: M3) -> Cuckoo.ClassStubNoReturnFunction<(String, [Quote], Double)> where M1.MatchedType == String, M2.MatchedType == [Quote], M3.MatchedType == Double {
	        let matchers: [Cuckoo.ParameterMatcher<(String, [Quote], Double)>] = [wrap(matchable: currency) { $0.0 }, wrap(matchable: quotes) { $0.1 }, wrap(matchable: timestamp) { $0.2 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockCurrencyStorageImpl.self, method: "persistQuotes(_: String, quotes: [Quote], timestamp: Double)", parameterMatchers: matchers))
	    }
	    
	    func fetchQuotes<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ currency: M1, force: M2) -> Cuckoo.ClassStubThrowingFunction<(String, Bool), [Quote]?> where M1.MatchedType == String, M2.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(String, Bool)>] = [wrap(matchable: currency) { $0.0 }, wrap(matchable: force) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockCurrencyStorageImpl.self, method: "fetchQuotes(_: String, force: Bool) throws -> [Quote]?", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_CurrencyStorageImpl: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func persistCurrencyList<M1: Cuckoo.Matchable>(_ supportedCurrencies: M1) -> Cuckoo.__DoNotUse<([Currency]), Void> where M1.MatchedType == [Currency] {
	        let matchers: [Cuckoo.ParameterMatcher<([Currency])>] = [wrap(matchable: supportedCurrencies) { $0 }]
	        return cuckoo_manager.verify("persistCurrencyList(_: [Currency])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func fetchCurrencyList() -> Cuckoo.__DoNotUse<(), [Currency]?> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("fetchCurrencyList() -> [Currency]?", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func persistQuotes<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(_ currency: M1, quotes: M2, timestamp: M3) -> Cuckoo.__DoNotUse<(String, [Quote], Double), Void> where M1.MatchedType == String, M2.MatchedType == [Quote], M3.MatchedType == Double {
	        let matchers: [Cuckoo.ParameterMatcher<(String, [Quote], Double)>] = [wrap(matchable: currency) { $0.0 }, wrap(matchable: quotes) { $0.1 }, wrap(matchable: timestamp) { $0.2 }]
	        return cuckoo_manager.verify("persistQuotes(_: String, quotes: [Quote], timestamp: Double)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func fetchQuotes<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ currency: M1, force: M2) -> Cuckoo.__DoNotUse<(String, Bool), [Quote]?> where M1.MatchedType == String, M2.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(String, Bool)>] = [wrap(matchable: currency) { $0.0 }, wrap(matchable: force) { $0.1 }]
	        return cuckoo_manager.verify("fetchQuotes(_: String, force: Bool) throws -> [Quote]?", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class CurrencyStorageImplStub: CurrencyStorageImpl {
    

    

    
     override func persistCurrencyList(_ supportedCurrencies: [Currency])   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func fetchCurrencyList() -> [Currency]?  {
        return DefaultValueRegistry.defaultValue(for: ([Currency]?).self)
    }
    
     override func persistQuotes(_ currency: String, quotes: [Quote], timestamp: Double)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func fetchQuotes(_ currency: String, force: Bool) throws -> [Quote]?  {
        return DefaultValueRegistry.defaultValue(for: ([Quote]?).self)
    }
    
}


// MARK: - Mocks generated from file: Currency Con/UI/Base/BasePresenter.swift at 2020-08-30 17:10:18 +0000

//
//  BasePresenter.swift
//  Currency Con
//
//  Created by Nemanja Stosic on 30/08/2020.
//  Copyright © 2020 No Scope Code. All rights reserved.
//

import Cuckoo
@testable import Currency_Con

import Foundation
import RxSwift


 class MockBasePresenter: BasePresenter, Cuckoo.ProtocolMock {
    
     typealias MocksType = BasePresenter
    
     typealias Stubbing = __StubbingProxy_BasePresenter
     typealias Verification = __VerificationProxy_BasePresenter

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: BasePresenter?

     func enableDefaultImplementation(_ stub: BasePresenter) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var disposeBag: DisposeBag {
        get {
            return cuckoo_manager.getter("disposeBag",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.disposeBag)
        }
        
    }
    

    

    

	 struct __StubbingProxy_BasePresenter: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var disposeBag: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockBasePresenter, DisposeBag> {
	        return .init(manager: cuckoo_manager, name: "disposeBag")
	    }
	    
	    
	}

	 struct __VerificationProxy_BasePresenter: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var disposeBag: Cuckoo.VerifyReadOnlyProperty<DisposeBag> {
	        return .init(manager: cuckoo_manager, name: "disposeBag", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class BasePresenterStub: BasePresenter {
    
    
     var disposeBag: DisposeBag {
        get {
            return DefaultValueRegistry.defaultValue(for: (DisposeBag).self)
        }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: Currency Con/UI/Base/BaseViewController.swift at 2020-08-30 17:10:18 +0000

//
//  BaseViewController.swift
//  Currency Con
//
//  Created by Nemanja Stosic on 30/08/2020.
//  Copyright © 2020 No Scope Code. All rights reserved.
//

import Cuckoo
@testable import Currency_Con

import Foundation
import UIKit


 class MockBaseViewController: BaseViewController, Cuckoo.ProtocolMock {
    
     typealias MocksType = BaseViewController
    
     typealias Stubbing = __StubbingProxy_BaseViewController
     typealias Verification = __VerificationProxy_BaseViewController

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: BaseViewController?

     func enableDefaultImplementation(_ stub: BaseViewController) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    

	 struct __StubbingProxy_BaseViewController: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	}

	 struct __VerificationProxy_BaseViewController: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	}
}

 class BaseViewControllerStub: BaseViewController {
    

    

    
}


// MARK: - Mocks generated from file: Currency Con/UI/Home/HomePresenter.swift at 2020-08-30 17:10:18 +0000

//
//  HomePresenter.swift
//  Currency Con
//
//  Created by Nemanja Stosic on 29/08/2020.
//  Copyright © 2020 No Scope Code. All rights reserved.
//

import Cuckoo
@testable import Currency_Con

import Foundation
import Resolver
import RxSwift


 class MockHomePresenter: HomePresenter, Cuckoo.ProtocolMock {
    
     typealias MocksType = HomePresenter
    
     typealias Stubbing = __StubbingProxy_HomePresenter
     typealias Verification = __VerificationProxy_HomePresenter

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: HomePresenter?

     func enableDefaultImplementation(_ stub: HomePresenter) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var disposeBag: DisposeBag {
        get {
            return cuckoo_manager.getter("disposeBag",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.disposeBag)
        }
        
    }
    

    

    
    
    
     func loadCurrencies(success: @escaping ([Currency]) -> Void, failure: @escaping (Error) -> Void)  {
        
    return cuckoo_manager.call("loadCurrencies(success: @escaping ([Currency]) -> Void, failure: @escaping (Error) -> Void)",
            parameters: (success, failure),
            escapingParameters: (success, failure),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.loadCurrencies(success: success, failure: failure))
        
    }
    
    
    
     func loadQuotes(_ currency: Currency, success: @escaping ([Quote]) -> Void, failure: @escaping (Error) -> Void)  {
        
    return cuckoo_manager.call("loadQuotes(_: Currency, success: @escaping ([Quote]) -> Void, failure: @escaping (Error) -> Void)",
            parameters: (currency, success, failure),
            escapingParameters: (currency, success, failure),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.loadQuotes(currency, success: success, failure: failure))
        
    }
    

	 struct __StubbingProxy_HomePresenter: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var disposeBag: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockHomePresenter, DisposeBag> {
	        return .init(manager: cuckoo_manager, name: "disposeBag")
	    }
	    
	    
	    func loadCurrencies<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(success: M1, failure: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(([Currency]) -> Void, (Error) -> Void)> where M1.MatchedType == ([Currency]) -> Void, M2.MatchedType == (Error) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(([Currency]) -> Void, (Error) -> Void)>] = [wrap(matchable: success) { $0.0 }, wrap(matchable: failure) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockHomePresenter.self, method: "loadCurrencies(success: @escaping ([Currency]) -> Void, failure: @escaping (Error) -> Void)", parameterMatchers: matchers))
	    }
	    
	    func loadQuotes<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(_ currency: M1, success: M2, failure: M3) -> Cuckoo.ProtocolStubNoReturnFunction<(Currency, ([Quote]) -> Void, (Error) -> Void)> where M1.MatchedType == Currency, M2.MatchedType == ([Quote]) -> Void, M3.MatchedType == (Error) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(Currency, ([Quote]) -> Void, (Error) -> Void)>] = [wrap(matchable: currency) { $0.0 }, wrap(matchable: success) { $0.1 }, wrap(matchable: failure) { $0.2 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockHomePresenter.self, method: "loadQuotes(_: Currency, success: @escaping ([Quote]) -> Void, failure: @escaping (Error) -> Void)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_HomePresenter: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var disposeBag: Cuckoo.VerifyReadOnlyProperty<DisposeBag> {
	        return .init(manager: cuckoo_manager, name: "disposeBag", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func loadCurrencies<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(success: M1, failure: M2) -> Cuckoo.__DoNotUse<(([Currency]) -> Void, (Error) -> Void), Void> where M1.MatchedType == ([Currency]) -> Void, M2.MatchedType == (Error) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(([Currency]) -> Void, (Error) -> Void)>] = [wrap(matchable: success) { $0.0 }, wrap(matchable: failure) { $0.1 }]
	        return cuckoo_manager.verify("loadCurrencies(success: @escaping ([Currency]) -> Void, failure: @escaping (Error) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func loadQuotes<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(_ currency: M1, success: M2, failure: M3) -> Cuckoo.__DoNotUse<(Currency, ([Quote]) -> Void, (Error) -> Void), Void> where M1.MatchedType == Currency, M2.MatchedType == ([Quote]) -> Void, M3.MatchedType == (Error) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(Currency, ([Quote]) -> Void, (Error) -> Void)>] = [wrap(matchable: currency) { $0.0 }, wrap(matchable: success) { $0.1 }, wrap(matchable: failure) { $0.2 }]
	        return cuckoo_manager.verify("loadQuotes(_: Currency, success: @escaping ([Quote]) -> Void, failure: @escaping (Error) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class HomePresenterStub: HomePresenter {
    
    
     var disposeBag: DisposeBag {
        get {
            return DefaultValueRegistry.defaultValue(for: (DisposeBag).self)
        }
        
    }
    

    

    
     func loadCurrencies(success: @escaping ([Currency]) -> Void, failure: @escaping (Error) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func loadQuotes(_ currency: Currency, success: @escaping ([Quote]) -> Void, failure: @escaping (Error) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}



 class MockHomePresenterImpl: HomePresenterImpl, Cuckoo.ClassMock {
    
     typealias MocksType = HomePresenterImpl
    
     typealias Stubbing = __StubbingProxy_HomePresenterImpl
     typealias Verification = __VerificationProxy_HomePresenterImpl

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: HomePresenterImpl?

     func enableDefaultImplementation(_ stub: HomePresenterImpl) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var disposeBag: DisposeBag {
        get {
            return cuckoo_manager.getter("disposeBag",
                superclassCall:
                    
                    super.disposeBag
                    ,
                defaultCall: __defaultImplStub!.disposeBag)
        }
        
        set {
            cuckoo_manager.setter("disposeBag",
                value: newValue,
                superclassCall:
                    
                    super.disposeBag = newValue
                    ,
                defaultCall: __defaultImplStub!.disposeBag = newValue)
        }
        
    }
    

    

    
    
    
     override func loadCurrencies(success: @escaping ([Currency]) -> Void, failure: @escaping (Error) -> Void)  {
        
    return cuckoo_manager.call("loadCurrencies(success: @escaping ([Currency]) -> Void, failure: @escaping (Error) -> Void)",
            parameters: (success, failure),
            escapingParameters: (success, failure),
            superclassCall:
                
                super.loadCurrencies(success: success, failure: failure)
                ,
            defaultCall: __defaultImplStub!.loadCurrencies(success: success, failure: failure))
        
    }
    
    
    
     override func loadQuotes(_ currency: Currency, success: @escaping ([Quote]) -> Void, failure: @escaping (Error) -> Void)  {
        
    return cuckoo_manager.call("loadQuotes(_: Currency, success: @escaping ([Quote]) -> Void, failure: @escaping (Error) -> Void)",
            parameters: (currency, success, failure),
            escapingParameters: (currency, success, failure),
            superclassCall:
                
                super.loadQuotes(currency, success: success, failure: failure)
                ,
            defaultCall: __defaultImplStub!.loadQuotes(currency, success: success, failure: failure))
        
    }
    

	 struct __StubbingProxy_HomePresenterImpl: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var disposeBag: Cuckoo.ClassToBeStubbedProperty<MockHomePresenterImpl, DisposeBag> {
	        return .init(manager: cuckoo_manager, name: "disposeBag")
	    }
	    
	    
	    func loadCurrencies<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(success: M1, failure: M2) -> Cuckoo.ClassStubNoReturnFunction<(([Currency]) -> Void, (Error) -> Void)> where M1.MatchedType == ([Currency]) -> Void, M2.MatchedType == (Error) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(([Currency]) -> Void, (Error) -> Void)>] = [wrap(matchable: success) { $0.0 }, wrap(matchable: failure) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockHomePresenterImpl.self, method: "loadCurrencies(success: @escaping ([Currency]) -> Void, failure: @escaping (Error) -> Void)", parameterMatchers: matchers))
	    }
	    
	    func loadQuotes<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(_ currency: M1, success: M2, failure: M3) -> Cuckoo.ClassStubNoReturnFunction<(Currency, ([Quote]) -> Void, (Error) -> Void)> where M1.MatchedType == Currency, M2.MatchedType == ([Quote]) -> Void, M3.MatchedType == (Error) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(Currency, ([Quote]) -> Void, (Error) -> Void)>] = [wrap(matchable: currency) { $0.0 }, wrap(matchable: success) { $0.1 }, wrap(matchable: failure) { $0.2 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockHomePresenterImpl.self, method: "loadQuotes(_: Currency, success: @escaping ([Quote]) -> Void, failure: @escaping (Error) -> Void)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_HomePresenterImpl: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var disposeBag: Cuckoo.VerifyProperty<DisposeBag> {
	        return .init(manager: cuckoo_manager, name: "disposeBag", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func loadCurrencies<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(success: M1, failure: M2) -> Cuckoo.__DoNotUse<(([Currency]) -> Void, (Error) -> Void), Void> where M1.MatchedType == ([Currency]) -> Void, M2.MatchedType == (Error) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(([Currency]) -> Void, (Error) -> Void)>] = [wrap(matchable: success) { $0.0 }, wrap(matchable: failure) { $0.1 }]
	        return cuckoo_manager.verify("loadCurrencies(success: @escaping ([Currency]) -> Void, failure: @escaping (Error) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func loadQuotes<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(_ currency: M1, success: M2, failure: M3) -> Cuckoo.__DoNotUse<(Currency, ([Quote]) -> Void, (Error) -> Void), Void> where M1.MatchedType == Currency, M2.MatchedType == ([Quote]) -> Void, M3.MatchedType == (Error) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(Currency, ([Quote]) -> Void, (Error) -> Void)>] = [wrap(matchable: currency) { $0.0 }, wrap(matchable: success) { $0.1 }, wrap(matchable: failure) { $0.2 }]
	        return cuckoo_manager.verify("loadQuotes(_: Currency, success: @escaping ([Quote]) -> Void, failure: @escaping (Error) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class HomePresenterImplStub: HomePresenterImpl {
    
    
     override var disposeBag: DisposeBag {
        get {
            return DefaultValueRegistry.defaultValue(for: (DisposeBag).self)
        }
        
        set { }
        
    }
    

    

    
     override func loadCurrencies(success: @escaping ([Currency]) -> Void, failure: @escaping (Error) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func loadQuotes(_ currency: Currency, success: @escaping ([Quote]) -> Void, failure: @escaping (Error) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: Currency Con/Usecase/CurrencyUsecase.swift at 2020-08-30 17:10:18 +0000

//
//  CurrencyUsecase.swift
//  Currency Con
//
//  Created by Nemanja Stosic on 29/08/2020.
//  Copyright © 2020 No Scope Code. All rights reserved.
//

import Cuckoo
@testable import Currency_Con

import Foundation
import Resolver
import RxSwift


 class MockCurrencyUsecase: CurrencyUsecase, Cuckoo.ProtocolMock {
    
     typealias MocksType = CurrencyUsecase
    
     typealias Stubbing = __StubbingProxy_CurrencyUsecase
     typealias Verification = __VerificationProxy_CurrencyUsecase

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: CurrencyUsecase?

     func enableDefaultImplementation(_ stub: CurrencyUsecase) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func fetchAvailableCurrencies() -> Observable<[Currency]> {
        
    return cuckoo_manager.call("fetchAvailableCurrencies() -> Observable<[Currency]>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.fetchAvailableCurrencies())
        
    }
    
    
    
     func fetchQuotes(_ currency: Currency) -> Observable<[Quote]> {
        
    return cuckoo_manager.call("fetchQuotes(_: Currency) -> Observable<[Quote]>",
            parameters: (currency),
            escapingParameters: (currency),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.fetchQuotes(currency))
        
    }
    

	 struct __StubbingProxy_CurrencyUsecase: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func fetchAvailableCurrencies() -> Cuckoo.ProtocolStubFunction<(), Observable<[Currency]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockCurrencyUsecase.self, method: "fetchAvailableCurrencies() -> Observable<[Currency]>", parameterMatchers: matchers))
	    }
	    
	    func fetchQuotes<M1: Cuckoo.Matchable>(_ currency: M1) -> Cuckoo.ProtocolStubFunction<(Currency), Observable<[Quote]>> where M1.MatchedType == Currency {
	        let matchers: [Cuckoo.ParameterMatcher<(Currency)>] = [wrap(matchable: currency) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockCurrencyUsecase.self, method: "fetchQuotes(_: Currency) -> Observable<[Quote]>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_CurrencyUsecase: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func fetchAvailableCurrencies() -> Cuckoo.__DoNotUse<(), Observable<[Currency]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("fetchAvailableCurrencies() -> Observable<[Currency]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func fetchQuotes<M1: Cuckoo.Matchable>(_ currency: M1) -> Cuckoo.__DoNotUse<(Currency), Observable<[Quote]>> where M1.MatchedType == Currency {
	        let matchers: [Cuckoo.ParameterMatcher<(Currency)>] = [wrap(matchable: currency) { $0 }]
	        return cuckoo_manager.verify("fetchQuotes(_: Currency) -> Observable<[Quote]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class CurrencyUsecaseStub: CurrencyUsecase {
    

    

    
     func fetchAvailableCurrencies() -> Observable<[Currency]>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<[Currency]>).self)
    }
    
     func fetchQuotes(_ currency: Currency) -> Observable<[Quote]>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<[Quote]>).self)
    }
    
}



 class MockCurrencyUsecaseImpl: CurrencyUsecaseImpl, Cuckoo.ClassMock {
    
     typealias MocksType = CurrencyUsecaseImpl
    
     typealias Stubbing = __StubbingProxy_CurrencyUsecaseImpl
     typealias Verification = __VerificationProxy_CurrencyUsecaseImpl

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: CurrencyUsecaseImpl?

     func enableDefaultImplementation(_ stub: CurrencyUsecaseImpl) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func fetchAvailableCurrencies() -> Observable<[Currency]> {
        
    return cuckoo_manager.call("fetchAvailableCurrencies() -> Observable<[Currency]>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.fetchAvailableCurrencies()
                ,
            defaultCall: __defaultImplStub!.fetchAvailableCurrencies())
        
    }
    
    
    
     override func fetchQuotes(_ currency: Currency) -> Observable<[Quote]> {
        
    return cuckoo_manager.call("fetchQuotes(_: Currency) -> Observable<[Quote]>",
            parameters: (currency),
            escapingParameters: (currency),
            superclassCall:
                
                super.fetchQuotes(currency)
                ,
            defaultCall: __defaultImplStub!.fetchQuotes(currency))
        
    }
    

	 struct __StubbingProxy_CurrencyUsecaseImpl: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func fetchAvailableCurrencies() -> Cuckoo.ClassStubFunction<(), Observable<[Currency]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockCurrencyUsecaseImpl.self, method: "fetchAvailableCurrencies() -> Observable<[Currency]>", parameterMatchers: matchers))
	    }
	    
	    func fetchQuotes<M1: Cuckoo.Matchable>(_ currency: M1) -> Cuckoo.ClassStubFunction<(Currency), Observable<[Quote]>> where M1.MatchedType == Currency {
	        let matchers: [Cuckoo.ParameterMatcher<(Currency)>] = [wrap(matchable: currency) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockCurrencyUsecaseImpl.self, method: "fetchQuotes(_: Currency) -> Observable<[Quote]>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_CurrencyUsecaseImpl: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func fetchAvailableCurrencies() -> Cuckoo.__DoNotUse<(), Observable<[Currency]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("fetchAvailableCurrencies() -> Observable<[Currency]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func fetchQuotes<M1: Cuckoo.Matchable>(_ currency: M1) -> Cuckoo.__DoNotUse<(Currency), Observable<[Quote]>> where M1.MatchedType == Currency {
	        let matchers: [Cuckoo.ParameterMatcher<(Currency)>] = [wrap(matchable: currency) { $0 }]
	        return cuckoo_manager.verify("fetchQuotes(_: Currency) -> Observable<[Quote]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class CurrencyUsecaseImplStub: CurrencyUsecaseImpl {
    

    

    
     override func fetchAvailableCurrencies() -> Observable<[Currency]>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<[Currency]>).self)
    }
    
     override func fetchQuotes(_ currency: Currency) -> Observable<[Quote]>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<[Quote]>).self)
    }
    
}

