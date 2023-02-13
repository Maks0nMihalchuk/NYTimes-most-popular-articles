//
//  ArticleMediaModel.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 11.02.2023.
//

import Foundation

protocol ArticleMediaModelProtocol {
    var copyright: String { get set }
    var url: String { get set }
    var imagePath: String { get set }
    var mediaData: Data? { get set }
}

struct ArticleMediaModel: ArticleMediaModelProtocol {
    
    var copyright: String
    var url: String
    var imagePath: String
    var mediaData: Data?
    
    init(copyright: String, url: String, imagePath: String, mediaData: Data? = nil) {
        self.copyright = copyright
        self.url = url
        self.imagePath = imagePath
        self.mediaData = mediaData
    }
    
    init(articleMedia: ArticleMediaModelProtocol) {
        self.copyright = articleMedia.copyright
        self.url = articleMedia.url
        self.imagePath = articleMedia.imagePath
        self.mediaData = articleMedia.mediaData
    }
}
