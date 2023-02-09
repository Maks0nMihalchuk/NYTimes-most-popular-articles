//
//  MostViewedModel.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import Foundation

class MostViewedModel: MPArticlesModelProtocol {
    
    private let articleProvider: ArticleProviderProtocol
    
    init(articleProvider: ArticleProviderProtocol) {
        self.articleProvider = articleProvider
    }
    
    func getArticles(completion: @escaping Articles) {
        articleProvider.getArticles(with: .viewed) { result in
            completion(result)
        }
    }
}
