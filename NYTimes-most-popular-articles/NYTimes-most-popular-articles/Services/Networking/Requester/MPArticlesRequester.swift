//
//  MPArticlesRequester.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 09.02.2023.
//

import Foundation
import Alamofire

enum MPArticlesRequester {
    
    private enum Constants {
        static let json = ".json"
        static let emailedPath = "emailed/"
        static let apiKey = "api-key"
    }
    
    case emailed
}

// MARK: - EndPointType
extension MPArticlesRequester: EndPointType {
    
    var path: String {
        switch self {
        case .emailed: return Constants.emailedPath + MPArticlesPeriod.thirtyDays.rawValue + Constants.json
        }
    }
    
    var parameters: HTTPParameters? {
        switch self {
        case .emailed: return [Constants.apiKey: AppConfiguration.shared.apiKey]
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .emailed: return .get
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .emailed: return HTTPHeaders(RequestHeaders.applicationJson)
        }
    }
}
