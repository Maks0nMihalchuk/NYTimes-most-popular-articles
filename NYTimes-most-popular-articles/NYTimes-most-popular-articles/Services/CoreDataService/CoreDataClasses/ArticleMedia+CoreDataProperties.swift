//
//  ArticleMedia+CoreDataProperties.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 11.02.2023.
//
//

import Foundation
import CoreData


extension ArticleMedia {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ArticleMedia> {
        return NSFetchRequest<ArticleMedia>(entityName: "ArticleMedia")
    }

    @NSManaged public var media_author: String
    @NSManaged public var media_url: String
    @NSManaged public var image_path: String
    @NSManaged public var article: Article?
}

// MARK: - ArticleMediaModelProtocol
extension ArticleMedia: ArticleMediaModelProtocol {
    
    var copyright: String {
        get { media_author }
        set { media_author = newValue }
        
    }
    var url: String {
        get { media_url }
        set { media_url = newValue }
    }
    var imagePath: String {
        get { image_path }
        set { image_path = newValue }
    }
    var mediaData: Data? {
        get { return nil }
        set { }
    }
    
    func fillWith(articleMedia: ArticleMediaModelProtocol) {
        
        copyright = articleMedia.copyright
        url = articleMedia.url
        imagePath = articleMedia.imagePath
    }
}

// MARK: - Identifiable
extension ArticleMedia : Identifiable {

}
