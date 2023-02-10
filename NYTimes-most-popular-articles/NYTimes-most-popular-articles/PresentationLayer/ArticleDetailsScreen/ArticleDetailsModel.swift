//
//  ArticleDetailsModel.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 09.02.2023.
//

import Foundation

protocol ArticleDetailsModelProtocol {
    
    func downloadArticleImage(completion: @escaping (Result<Data, NetworkError>) -> Void)
    func getArticleInformation() -> ArticleModel
}

class ArticleDetailsModel: ArticleDetailsModelProtocol {
    
    private let articleProvider: ArticleProviderProtocol
    private let fileService: FileServiceProtocol
    private var article: ArticleModel
    
    init(articleProvider: ArticleProviderProtocol, fileService: FileServiceProtocol, article: ArticleModel) {
        self.articleProvider = articleProvider
        self.fileService = fileService
        self.article = article
    }
    
    func getArticleInformation() -> ArticleModel {
        return article
    }
    
    func downloadArticleImage(
        completion: @escaping (Result<Data, NetworkError>) -> Void) {
            let mediaURL = article.media.url
            
            if mediaURL.isEmpty {
                completion(.success(Data()))
                return
            }
            
        articleProvider
                .downloadArticleImage( with: .download(mediaURL)) { [weak self] result in
            guard let self = self else {
                completion(.failure(.clientError))
                return
            }
            
            switch result {
            case .success(let data):
                
                guard
                    let dataURL = data.url,
                    let fileName = URL(string: self.article.media.url)?.lastPathComponent,
                    let fileData = try? Data(contentsOf: dataURL)
                else {
                    completion(.failure(.decodingError))
                    return
                }

                self.fileService.writeFile(file: fileData, name: fileName)
                completion(.success(fileData))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
