//
//  MPArticlesPresenter.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 09.02.2023.
//

import Foundation

protocol MPArticlesPresenterProtocol {
    
    func sendDataRequest()
    func getNumberOfArticles() -> Int
    func getArticlesByIndex(_ index: Int) -> ArticleModel
}
 
class MPArticlesPresenter {
    
    private let model: MPArticlesModelProtocol
    private var articles: [ArticleModel]
    
    weak var view: MPArticlesViewProtocol?
    
    init(_ view: MPArticlesViewProtocol?, model: MPArticlesModelProtocol) {
        self.view = view
        self.model = model
        self.articles = []
    }
    
    func getNumberOfArticles() -> Int {
        return articles.count
    }
    
    func getArticlesByIndex(_ index: Int) -> ArticleModel {
        return articles[index]
    }
    
    func sendDataRequest() {
        view?.showLoading()
        model.getArticles { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.view?.hideLoading()
                switch result {
                case .success(let articles):
                    self.articles = articles
                    self.view?.reloadView()
                case .failure(let error):
                    break
                }
            }
        }
    }
    
    
}

// MARK: - MPArticlesPresenterProtocol
extension MPArticlesPresenter: MPArticlesPresenterProtocol {
    
}
