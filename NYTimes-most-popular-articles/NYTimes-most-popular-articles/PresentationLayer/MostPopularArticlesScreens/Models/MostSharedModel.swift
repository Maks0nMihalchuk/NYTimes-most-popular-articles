//
//  MostSharedModel.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import Foundation

class MostSharedModel: MPArticlesModelProtocol {
    
    private let articleProvider: ArticleProviderProtocol
    
    init(articleProvider: ArticleProviderProtocol) {
        self.articleProvider = articleProvider
    }
    
    func getArticles(completion: @escaping Articles) {
        articleProvider.getArticles(with: .shared) { result in
            completion(result)
        }
    }
}
