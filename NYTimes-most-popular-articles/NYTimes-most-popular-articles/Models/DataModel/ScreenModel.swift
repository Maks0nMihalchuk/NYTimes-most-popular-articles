//
//  ScreenModel.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 10.02.2023.
//

import Foundation

enum ScreenModel {
    case mostEmailed
    case mostShared
    case mostViewed
    case favorites
    
    var title: String {
        switch self {
        case .mostEmailed: return "Most emailed"
        case .mostShared: return "Most shared"
        case .mostViewed: return "Most viewed"
        case .favorites: return "Favorites"
        }
    }
    
    var imageName: String {
        switch self {
        case .mostEmailed: return "list.bullet.rectangle"
        case .mostShared: return "square.and.arrow.up"
        case .mostViewed: return "viewfinder.circle"
        case .favorites: return "star"
        }
    }
    
    var selectedImageName: String {
        switch self {
        case .mostEmailed: return "list.bullet.rectangle.fill"
        case .mostShared: return "square.and.arrow.up.fill"
        case .mostViewed: return "viewfinder.circle.fill"
        case .favorites: return "star.fill"
        }
    }
}
