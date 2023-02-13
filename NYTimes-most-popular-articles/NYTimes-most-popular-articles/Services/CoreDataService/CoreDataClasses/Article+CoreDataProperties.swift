//
//  Article+CoreDataProperties.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 11.02.2023.
//
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }
    
    @NSManaged public var is_favorite: Bool
    
    @NSManaged public var article_id: Int64
    @NSManaged public var article_url: String

    @NSManaged public var article_author: String
    @NSManaged public var article_published: String
    @NSManaged public var article_updated: String
    @NSManaged public var article_title: String
    @NSManaged public var article_abstract: String
    @NSManaged public var article_type: String
    @NSManaged public var article_section: String
    @NSManaged public var article_sub_section: String
    @NSManaged public var article_source: String

    @NSManaged public var articleMedia: ArticleMedia
}

// MARK: - ArticleModelProtocol
extension Article: ArticleModelProtocol {
    
    var isFavorite: Bool {
        get { is_favorite }
        set { is_favorite = newValue }
    }
    
    var articleID: Int {
        get { Int(article_id) }
        set { article_id = Int64(newValue) }
    }
    
    var url: String {
        get { article_url }
        set { article_url = newValue }
    }
    
    var title: String {
        get { article_title }
        set { article_title = newValue }
    }
    
    var byline: String {
        get { article_author }
        set { article_author = newValue }
    }
    
    var abstract: String {
        get { article_abstract }
        set { article_abstract = newValue }
    }
    
    var published: String {
        get { article_published }
        set { article_published = newValue }
    }
    
    var articleUpdated: String {
        get { article_updated }
        set { article_updated = newValue }
    }
    
    var section: String {
        get { article_section }
        set { article_section = newValue }
    }
    
    var subSection: String {
        get { article_sub_section }
        set { article_sub_section = newValue }
    }
    
    var type: String {
        get { article_type }
        set { article_type = newValue }
    }
    
    var source: String {
        get { article_source }
        set { article_source = newValue }
    }
    
    var media: ArticleMediaModelProtocol {
        get { ArticleMediaModel(articleMedia: self.articleMedia) }
        set {  }
    }
    
    func fillWith(article: ArticleModelProtocol, in context: NSManagedObjectContext) {
        isFavorite = article.isFavorite
        
        articleID = article.articleID
        url = article.url
        title = article.title
        byline = article.byline
        abstract = article.abstract
        published = article.published
        articleUpdated = article.articleUpdated
        section = article.section
        subSection = article.subSection
        type = article.type
        source = article.source
    
        let articleMedia = ArticleMedia(context: context)
        articleMedia.fillWith(articleMedia: article.media)
        articleMedia.article = self
        media = articleMedia
    }
}

// MARK: - Identifiable
extension Article : Identifiable {

}
