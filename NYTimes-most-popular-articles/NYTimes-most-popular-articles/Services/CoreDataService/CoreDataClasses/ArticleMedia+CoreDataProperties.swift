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

    @NSManaged public var copyright: String?
    @NSManaged public var url: String?
    @NSManaged public var imagePath: String?
    @NSManaged public var article: Article?

}

extension ArticleMedia : Identifiable {

}
