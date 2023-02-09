//
//  ArticleProvider.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 09.02.2023.
//

import Foundation

typealias Articles = (Result<[ArticleModel], NetworkError>) -> Void

protocol ArticleProviderProtocol {
    
    func getArticles(with type: MPArticlesRequester,
                     completion: @escaping Articles)
}

class ArticleProvider {

    private let network: Networker
    private let articleMapper: MapArticleModelServiceProtocol
    
    init(network: Networker, articleMapper: MapArticleModelServiceProtocol) {
        self.network = network
        self.articleMapper = articleMapper
    }
}

extension ArticleProvider: ArticleProviderProtocol {
    
    func getArticles(with type: MPArticlesRequester,
                     completion: @escaping Articles) {
        network.call(type: type) { [unowned self] (result: Result<ArticleResponse, NetworkError>) in
            switch result {
            case .success(let articlesResponce):
                let articles = articleMapper
                    .mapArticleResponceModelToArticleModel(responseModel: articlesResponce)
                completion(.success(articles))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
