//
//  EndPointType.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 09.02.2023.
//

import Foundation
import Alamofire

typealias HTTPParameters = [String: String]


// MARK: - RequestBuilder
protocol RequestBuilder {
    func buildRequest() throws -> URLRequest
}

extension RequestBuilder {
    public var urlRequest: URLRequest? { return try? buildRequest() }
}

// MARK: - EndPointType
protocol EndPointType: RequestBuilder {
    
    var baseURL: String { get }
    var path: String { get }
    var parameters: HTTPParameters? { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
}

// MARK: - extending EndPointType functionality with URLBuilder
extension EndPointType {
    
    func buildRequest() throws -> URLRequest {
        guard var url = URL(string: baseURL) else {
            throw NetworkError.canNotBuildRequest
        }
        
        if !path.isEmpty {
            url.append(path: path)
        }
        
        if let parameters = parameters {
            parameters.forEach {
                url.append(queryItems: [URLQueryItem(name: $0, value: $1)])
            }
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        
        if let headers = headers {
            headers.forEach { request.addValue($0.value, forHTTPHeaderField: $0.name) }
        }
        
        return request
    }
}
