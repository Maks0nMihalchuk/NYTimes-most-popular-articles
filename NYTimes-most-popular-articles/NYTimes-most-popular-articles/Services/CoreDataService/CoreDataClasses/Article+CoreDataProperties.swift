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

    @NSManaged public var abstract: String?
    @NSManaged public var title: String?
    @NSManaged public var type: String?
    @NSManaged public var byline: String?
    @NSManaged public var subSection: String?
    @NSManaged public var section: String?
    @NSManaged public var updatedPublished: String?
    @NSManaged public var published: String?
    @NSManaged public var source: String?
    @NSManaged public var id: Int64
    @NSManaged public var url: String?
    @NSManaged public var isFavorite: Bool
    @NSManaged public var articleMedia: ArticleMedia?

}

extension Article : Identifiable {

}
