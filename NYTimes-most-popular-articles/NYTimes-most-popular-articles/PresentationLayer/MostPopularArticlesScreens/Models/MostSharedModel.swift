//
//  MostSharedModel.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import Foundation

class MostSharedModel: MPArticlesModelProtocol {
    
    private let articleProvider: ArticleProviderProtocol
    private let mapper: MapArticleServiceProtocol
    
    init(articleProvider: ArticleProviderProtocol, mapper: MapArticleServiceProtocol) {
        self.articleProvider = articleProvider
        self.mapper = mapper
    }
    
    func getArticles(completion: @escaping (Result<[ArticleModel] ,NetworkError>) -> Void) {
        articleProvider.getArticles(with: .shared) { [weak self] result in
            guard let self = self else {
                completion(.failure(.clientError))
                return
            }
            
            switch result {
            case .success(let articleResponse):
                let articles = self.mapper
                    .mapArticleResponceModelToArticleModel(
                        responseModel: articleResponse
                    )
                completion(.success(articles))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
}
