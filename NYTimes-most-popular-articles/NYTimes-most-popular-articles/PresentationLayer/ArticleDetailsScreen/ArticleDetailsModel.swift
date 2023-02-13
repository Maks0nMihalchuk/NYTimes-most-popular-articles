//
//  ArticleDetailsModel.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 09.02.2023.
//

import Foundation

protocol ArticleDetailsModelProtocol {
    
    func downloadArticleImage(by url: String, completion: @escaping (Result<ArticleMediaModel, NetworkError>) -> Void)
    func downloadArticleImageFromLocalStorage(by path: String) -> Data?
    
    func removeArticleFromFavorites(article: ArticleModel)
    func addArticleToFavorites(article: ArticleModel)
}

class ArticleDetailsModel: ArticleDetailsModelProtocol {
    
    private let articleDataService: ArticleDataServiceProtocol
    private let articleProvider: ArticleProviderProtocol
    private let fileService: FileServiceProtocol
    
    init(articleProvider: ArticleProviderProtocol,
         articleDataService: ArticleDataServiceProtocol,
         fileService: FileServiceProtocol) {
        self.articleProvider = articleProvider
        self.articleDataService = articleDataService
        self.fileService = fileService
    }
    
    func removeArticleFromFavorites(article: ArticleModel) {
        articleDataService.deleteArticle(by: article.articleID)
    }
    
    func addArticleToFavorites(article: ArticleModel) {
        articleDataService.writeArticle(newArticle: article)
    }
    
    func downloadArticleImageFromLocalStorage(by path: String) -> Data? {
        let imageData = fileService.getFile(by: path)
        return imageData
    }
    
    func downloadArticleImage(by url: String, completion: @escaping (Result<ArticleMediaModel, NetworkError>) -> Void) {
        if url.isEmpty {
            completion(.success(ArticleMediaModel(copyright: "", url: "", imagePath: "", mediaData: Data())))
            return
        }
        
        articleProvider.downloadArticleImage(with: .download(url)) { [weak self] result in
            guard let self = self else {
                completion(.failure(.clientError))
                return
            }
            
            switch result {
            case .success(let response):
                guard
                    let dataURL = response.url,
                    let fileName = URL(string: url)?.lastPathComponent,
                    let fileData = try? Data(contentsOf: dataURL)
                else {
                    completion(.failure(.decodingError))
                    return
                }
                
                self.fileService.writeFile(file: fileData, name: fileName)
                completion(.success(ArticleMediaModel(copyright: "", url: "", imagePath: fileName, mediaData: fileData)))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
