//
//  ArticleResponse.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import Foundation

struct ArticleResponse: Decodable {
    let results: [ArticleResponseResult]
}

struct ArticleResponseResult: Decodable {
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
    var media: [MediaResponse]
    
    enum CodingKeys: String, CodingKey {
        case url, id, source, updated, section
        case byline, type, title, abstract, media
        case publishedDate = "published_date"
        case subSection = "subsection"
    }
}

struct MediaResponse: Decodable {
    var copyright: String
    var mediaMetadata: [MediaMetadataResponse]
    
    enum CodingKeys: String, CodingKey {
        case copyright
        case mediaMetadata = "media-metadata"
    }
}

struct MediaMetadataResponse: Decodable {
    var url: String
}
