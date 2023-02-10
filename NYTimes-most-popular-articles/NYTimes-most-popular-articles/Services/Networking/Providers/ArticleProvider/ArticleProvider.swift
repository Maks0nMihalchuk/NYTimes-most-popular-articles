//
//  ArticleProvider.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 09.02.2023.
//

import Foundation

typealias Articles = (Result<ArticleResponse, NetworkError>) -> Void
typealias ImageDownload = (Result<ArticleMediaResponse, NetworkError>) -> Void

protocol ArticleProviderProtocol {
    
    func getArticles(with type: MPArticlesRequester,
                     completion: @escaping Articles)
    func downloadArticleImage(with type: MPArticlesRequester,
                              completion: @escaping ImageDownload)
}

class ArticleProvider {

    private let network: Networker
    
    init(network: Networker) {
        self.network = network
    }
}

// MARK: - ArticleProviderProtocol
extension ArticleProvider: ArticleProviderProtocol {
    
    func getArticles(with type: MPArticlesRequester, completion: @escaping Articles) {
        network.call(type: type) { (result: Result<ArticleResponse, NetworkError>) in
            completion(result)
        }
    }
    
    func downloadArticleImage(with type: MPArticlesRequester,
                              completion: @escaping ImageDownload) {
        network.download(type: type) { (result: Result<ArticleMediaResponse, NetworkError>) in
            completion(result)
        }
    }
}
