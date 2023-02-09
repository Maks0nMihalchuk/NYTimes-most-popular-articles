//
//  ArticleProvider.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 09.02.2023.
//

import Foundation

typealias Articles = (Result<ArticleResponse, NetworkError>) -> Void

protocol ArticleProviderProtocol {
    
    func getArticles(with type: MPArticlesRequester,
                     completion: @escaping Articles)
}

class ArticleProvider {

    private let network: Networker
    
    init(network: Networker) {
        self.network = network
    }
}

extension ArticleProvider: ArticleProviderProtocol {
    
    func getArticles(with type: MPArticlesRequester,
                     completion: @escaping Articles) {
        network.call(type: type) { result in
            completion(result)
        }
    }
}
