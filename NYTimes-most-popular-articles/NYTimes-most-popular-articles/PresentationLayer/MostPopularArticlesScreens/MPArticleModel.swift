//
//  MPArticleModel.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 09.02.2023.
//

import Foundation

protocol MPArticlesModelProtocol {
    
    func getArticles(completion: @escaping (Result<[ArticleModel] ,NetworkError>) -> Void)
    func syncDataWithLocalStorage(networkArticles: [ArticleModel]) -> [ArticleModel]
}

class MPArticleModel<T: EndPointType> {
    
    private let articleDataService: ArticleDataServiceProtocol
    private let articleProvider: ArticleProviderProtocol
    private let mapper: MapArticleServiceProtocol
    private let endPoint: T
    
    init(articleProvider: ArticleProviderProtocol,
         mapper: MapArticleServiceProtocol,
         articleDataService: ArticleDataServiceProtocol,
         endPoint: T) {
        self.articleProvider = articleProvider
        self.mapper = mapper
        self.articleDataService = articleDataService
        self.endPoint = endPoint
    }
}

// MARK: - MPArticlesModelProtocol
extension MPArticleModel: MPArticlesModelProtocol {
    
    func getArticles(completion: @escaping (Result<[ArticleModel] ,NetworkError>) -> Void) {
        guard let type = endPoint as? MPArticlesRequester else { return }
        
        articleProvider.getArticles(with: type) { [weak self] result in
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
    
    func syncDataWithLocalStorage(networkArticles: [ArticleModel]) -> [ArticleModel] {
        var articles = networkArticles
        let localArticles = self.articleDataService.getAllArticles()
        
        if localArticles.isEmpty {
            articles = networkArticles.map {
                return ArticleModel(isFavorite: false, articleID: $0.articleID, url: $0.url, title: $0.title, byline: $0.byline, abstract: $0.abstract, published: $0.published, update: $0.articleUpdated, section: $0.section, subSection: $0.subSection, type: $0.type, source: $0.source, media: $0.media)
            }
            
            return articles
        }
        
        networkArticles.enumerated().forEach { article in
            if let localArticle = localArticles.filter({ $0.articleID == article.element.articleID }).first {
                articles[article.offset].isFavorite = localArticle.isFavorite
                articles[article.offset].media.imagePath = localArticle.media.imagePath
            } else {
                articles[article.offset].isFavorite = false
            }
        }
        return articles
    }
}
