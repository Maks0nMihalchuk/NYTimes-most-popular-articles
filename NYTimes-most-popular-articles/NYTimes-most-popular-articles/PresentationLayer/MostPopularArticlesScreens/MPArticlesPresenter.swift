//
//  MPArticlesPresenter.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 09.02.2023.
//

import Foundation

struct MPArticlesPresenterRoutes {
    var onArticleDetails: BlockWith<ArticleModel>
}

protocol MPArticlesPresenterProtocol {
    
    func sendDataRequest()
    func showArticleDetails(by index: Int)
    func getNumberOfArticles() -> Int
    func getArticlesByIndex(_ index: Int) -> ArticleModel
    func syncDataWithLocalStorage()
}
 
class MPArticlesPresenter {
    
    private let model: MPArticlesModelProtocol
    private var routes: MPArticlesPresenterRoutes
    private var articles: [ArticleModel]
    
    weak var view: MPArticlesViewProtocol?
    
    init(_ view: MPArticlesViewProtocol?,
         model: MPArticlesModelProtocol,
         routes: MPArticlesPresenterRoutes) {
        self.view = view
        self.model = model
        self.routes = routes
        self.articles = []
    }
}

// MARK: - MPArticlesPresenterProtocol
extension MPArticlesPresenter: MPArticlesPresenterProtocol {
    
    func showArticleDetails(by index: Int) {
        let article = articles[index]
        routes.onArticleDetails(article)
    }
    
    func getNumberOfArticles() -> Int {
        return articles.count
    }
    
    func getArticlesByIndex(_ index: Int) -> ArticleModel {
        return articles[index]
    }
    
    func syncDataWithLocalStorage() {
        let synchronizedData = model.syncDataWithLocalStorage(networkArticles: articles)
        self.articles = synchronizedData
        view?.reloadView()
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
                    self.syncDataWithLocalStorage()
                    self.view?.reloadView()
                case .failure(let error):
                    self.view?.showError(with: error.description)
                }
            }
        }
    }
}
