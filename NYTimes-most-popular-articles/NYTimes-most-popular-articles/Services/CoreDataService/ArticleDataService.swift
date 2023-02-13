//
//  ArticleDataService.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 11.02.2023.
//

import Foundation
import CoreData

protocol ArticleDataServiceProtocol {
    func writeArticle(newArticle: ArticleModel)
    func getArticle(by id: Int) -> ArticleModel?
    func getAllArticles() -> [ArticleModel]
    func deleteArticle(by id: Int)
}

class ArticleDataService: ArticleDataServiceProtocol {
    
    private enum Constants {
        static let articleEntityName = "Article"
    }
    
    private let coreDataService: CoreDataService
    
    // MARK: - Write
    func writeArticle(newArticle: ArticleModel) {
        let context = coreDataService.getContext()
        
        if !self.checkForArticle(by: newArticle.articleID, context: context) {
            guard let articleEntity = NSEntityDescription.entity(forEntityName: Constants.articleEntityName, in: context) else { return }

            guard let article = NSManagedObject(entity: articleEntity, insertInto: context) as? Article else { return }
            
            article.fillWith(article: newArticle, in: context)
            coreDataService.saveContext(context: context)
        }
    }
    
    // MARK: - Get
    func getAllArticles() -> [ArticleModel] {
        let context = coreDataService.getContext(main: true)
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.articleEntityName)
        guard let articles = try? context.fetch(request) as? [Article] else { return [] }
        
        return  articles.map { article in return ArticleModel(article: article) }
    }
    
    func getArticle(by id: Int) -> ArticleModel? {
        let context = coreDataService.getContext(main: true)
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.articleEntityName)
        guard let article = (try? context.fetch(request) as? [Article])?.first(where: { $0.article_id == id }) else { return nil }
        
        return ArticleModel(article: article)
    }
    
    // MARK: - Delete
    func deleteArticle(by id: Int) {
        let context = coreDataService.getContext()
        
        guard let article = getArticle(by: id, context: context) else { return }
        
        context.delete(article)
        coreDataService.saveContext(context: context)
    }
    
    // MARK: - Init
    init(coreDataService: CoreDataService) {
        self.coreDataService = coreDataService
    }
}

// MARK: - Private methods
private extension ArticleDataService {
    
    func checkForArticle(by id: Int, context: NSManagedObjectContext) -> Bool {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.articleEntityName)
        request.predicate = NSPredicate(format: "article_id == \(id)")
        
        guard let _ = (try? context.fetch(request) as? [Article])?.first else {
            return false
        }
        
        return true
    }
    
    func getArticle(by id: Int, context: NSManagedObjectContext) -> Article? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.articleEntityName)
        request.predicate = NSPredicate(format: "article_id == \(id)")
        guard let article = (try? context.fetch(request) as? [Article])?.first else { return nil }
        return article
    }
}
