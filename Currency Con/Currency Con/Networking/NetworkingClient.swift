//
//  NetworkingClient.swift
//  Currency Con
//
//  Created by Nemanja Stosic on 29/08/2020.
//  Copyright © 2020 No Scope Code. All rights reserved.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift

protocol NetworkingClient {
    func request<T : BaseModel>(url: URLConvertible, method: HTTPMethod, parameters: [String : Any]?, headers: [String : String]?) -> Observable<T>
}

fileprivate class NetworkingClientRequestInterceptor: RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlComponents = URLComponents(url: urlRequest.url!, resolvingAgainstBaseURL: false)
        if urlComponents?.queryItems == nil {
            urlComponents?.queryItems = [URLQueryItem]()
        }
        urlComponents?.queryItems?.append(URLQueryItem(name: ModelConstants.apiKey, value: Constants.apiKey))
        return completion(.success(URLRequest(url: (urlComponents?.url)!)))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        completion(.doNotRetry)
    }
}

class NetworkingClientImpl: NetworkingClient {
    fileprivate var session: Session = {
        let config = URLSessionConfiguration.default
        let session = Session(configuration: config, interceptor: NetworkingClientRequestInterceptor())
        return session
    }()
    fileprivate let decoder = JSONDecoder()
    
    func request<T : BaseModel>(url: URLConvertible, method: HTTPMethod, parameters: [String : Any]?, headers: [String : String]?) -> Observable<T> {
        session.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: HTTPHeaders(headers ?? [:])).rx.responseJSON().flatMap { [unowned self] (responseJson) -> Observable<T> in
            if (responseJson.response?.statusCode == 200 && responseJson.data != nil) {
                let responseModel = try self.decoder.decode(T.self, from: responseJson.data!)
                return Observable<T>.just(responseModel)
            }
            return Observable<T>.error(BaseException())
        }
    }
}
