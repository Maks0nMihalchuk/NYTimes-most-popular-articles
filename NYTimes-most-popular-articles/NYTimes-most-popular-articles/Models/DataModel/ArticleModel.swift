//
//  ArticleModel.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 09.02.2023.
//

import Foundation

struct ArticleModel {
    var isFavorite: Bool
    
    var url: String
    var id: Int
    var source: String
    var publishedDate: String
    var updated: String
    var section: String
    var subSection: String
    var byline: String
    var type: String
    var title: String
    var abstract: String
    var media: ArticleMediaModel
}

struct ArticleMediaModel {
    var copyright: String
    var mediaMetadata: [ArticleMediaMetadataModel]
    
}

struct ArticleMediaMetadataModel {
    var url: String
}
