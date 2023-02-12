//
//  FavoritesArticlesModel.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import Foundation

protocol FavoritesArticlesModelProtocol {
    
    func getAllArticlesFromLocalStorage() -> [ArticleModel]
}

class FavoritesArticlesModel: FavoritesArticlesModelProtocol {
    
    private let articleDataService: ArticleDataServiceProtocol
    
    init(articleDataService: ArticleDataServiceProtocol) {
        self.articleDataService = articleDataService
    }
    
    func getAllArticlesFromLocalStorage() -> [ArticleModel] {
         return articleDataService.getAllArticles()
    }
}
