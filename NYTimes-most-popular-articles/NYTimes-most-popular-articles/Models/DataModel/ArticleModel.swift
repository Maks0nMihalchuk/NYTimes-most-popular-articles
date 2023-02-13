//
//  ArticleModel.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 09.02.2023.
//

import Foundation

protocol ArticleModelProtocol {
    
    var isFavorite: Bool { get set }
    
    var articleID: Int { get set }
    var url: String { get set }
    var title: String { get set }
    var byline: String { get set }
    var abstract: String { get set }
    var published: String { get set }
    var articleUpdated: String { get set }
    var section: String { get set }
    var subSection: String { get set }
    var type: String { get set }
    var source: String { get set }
    
    var media: ArticleMediaModelProtocol { get set }
}

struct ArticleModel: ArticleModelProtocol {
    
    var isFavorite: Bool
    
    var articleID: Int
    var url: String
    var title: String
    var byline: String
    var abstract: String
    var published: String
    var articleUpdated: String
    var section: String
    var subSection: String
    var type: String
    var source: String
    var media: ArticleMediaModelProtocol
    
    init(isFavorite: Bool, articleID: Int, url: String, title: String, byline: String, abstract: String, published: String, update: String, section: String, subSection: String, type: String, source: String, media: ArticleMediaModelProtocol) {
        self.isFavorite = isFavorite
        self.articleID = articleID
        self.url = url
        self.title = title
        self.byline = byline
        self.abstract = abstract
        self.published = published
        self.articleUpdated = update
        self.section = section
        self.subSection = subSection
        self.type = type
        self.source = source
        self.media = media
    }
    
    init(article: ArticleModelProtocol) {
        self.isFavorite = article.isFavorite
        self.articleID = article.articleID
        self.url = article.url
        self.title = article.title
        self.byline = article.byline
        self.abstract = article.abstract
        self.published = article.published
        self.articleUpdated = article.articleUpdated
        self.section = article.section
        self.subSection = article.subSection
        self.type = article.type
        self.source = article.source
        self.media = article.media
    }
}
