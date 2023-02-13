//
//  ErrorMessage.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 09.02.2023.
//

import Foundation

enum NetworkError: Error {
    case canNotBuildRequest
    case reachabilityError
    case decodingError
    case serverError
    case clientError
    case unspecifiedError
    case customError(withMessage: String)
    
    var description: String {
        switch self {
        case .canNotBuildRequest:
            return "Building request failed"
        case .reachabilityError:
            return "Internet connection problem. Please check your internet connection."
        case .decodingError:
            return "We were unable to identify the data that came from the server. Please try again later."
        case .serverError:
            return "An error occurred on the server side. Please try again later."
        case .clientError:
            return "An error occurred on the client side. Please try again later."
        case .unspecifiedError:
            return "For unknown reasons, something went wrong. Please try again later."
        case .customError(let message):
            return message
        }
    }
}
