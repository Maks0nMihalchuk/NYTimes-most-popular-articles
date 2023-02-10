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
        static let sharedPath = "shared/"
        static let viewedPath = "viewed/"
        static let apiKey = "api-key"
        static let emptyString = ""
    }
    
    case emailed
    case shared
    case viewed
    case download(String)
}

// MARK: - EndPointType
extension MPArticlesRequester: EndPointType {
    
    var baseURL: String {
        switch self {
        case .download(let url): return url
        default: return AppConfiguration.shared.apiURL
        }
    }
    
    var path: String {
        let defaultPath = MPArticlesPeriod.thirtyDays.rawValue + Constants.json
        switch self {
        case .emailed: return Constants.emailedPath + defaultPath
        case .shared: return Constants.sharedPath + defaultPath
        case .viewed: return Constants.viewedPath + defaultPath
        case .download(_): return Constants.emptyString
        }
    }
    
    var parameters: HTTPParameters? {
        switch self {
        case .emailed, .shared, .viewed:
            return [Constants.apiKey: AppConfiguration.shared.apiKey]
        case .download(_): return nil
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .emailed, .shared, .viewed, .download(_): return .get
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .emailed, .shared, .viewed, .download(_): return HTTPHeaders(RequestHeaders.applicationJson)
        }
    }
}
