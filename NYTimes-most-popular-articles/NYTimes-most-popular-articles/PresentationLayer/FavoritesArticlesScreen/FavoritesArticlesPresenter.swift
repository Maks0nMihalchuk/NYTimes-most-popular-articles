//
//  FavoritesArticlesPresenter.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import Foundation

protocol FavoritesArticlesPresenterProtocol {
    
}

class FavoritesArticlesPresenter: FavoritesArticlesPresenterProtocol {
    
    private let model: FavoritesArticlesModelProtocol
    
    weak var view: FavoritesArticlesViewProtocol?
    
    init(_ view: FavoritesArticlesViewProtocol?, model: FavoritesArticlesModelProtocol) {
        self.model = model
        self.view = view
    }
}
