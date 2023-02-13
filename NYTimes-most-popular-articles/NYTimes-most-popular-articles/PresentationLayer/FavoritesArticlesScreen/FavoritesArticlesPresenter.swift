//
//  FavoritesArticlesPresenter.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import Foundation

struct FAPresenterRoutes {
    var onArticleDetails: BlockWith<ArticleModel>
}

protocol FavoritesArticlesPresenterProtocol {
    
    func showArticleDetails(by index: Int)
    func getNumberOfArticles() -> Int
    func getArticlesByIndex(_ index: Int) -> ArticleModel
    func checkIfListOfFavoritesIsEmpty()
}

class FavoritesArticlesPresenter {
    
    private let model: FavoritesArticlesModelProtocol
    private var routes: FAPresenterRoutes
    private var articles: [ArticleModel]
    
    private var state: FavoritesScreenState? {
        didSet {
            guard let state = state else { return }
            if state != oldValue {
                view?.showViewAccording(to: state)
            }
        }
    }
    
    weak var view: FavoritesArticlesViewProtocol?
    
    init(_ view: FavoritesArticlesViewProtocol?, model: FavoritesArticlesModelProtocol, routes: FAPresenterRoutes) {
        self.model = model
        self.view = view
        self.routes = routes
        self.articles = []
    }
}

// MARK: - FavoritesArticlesPresenterProtocol
extension FavoritesArticlesPresenter: FavoritesArticlesPresenterProtocol {
    
    func showArticleDetails(by index: Int) {
        let article = articles[index]
        routes.onArticleDetails(article)
    }
    
    func checkIfListOfFavoritesIsEmpty() {
        articles = model.getAllArticlesFromLocalStorage()
        view?.reloadTableView()
        
        if articles.isEmpty {
            self.state = .empty
        } else {
            self.state = .notEmpty
        }
    }
    
    func getNumberOfArticles() -> Int {
        return articles.count
    }
    
    func getArticlesByIndex(_ index: Int) -> ArticleModel {
        return articles[index]
    }
}
