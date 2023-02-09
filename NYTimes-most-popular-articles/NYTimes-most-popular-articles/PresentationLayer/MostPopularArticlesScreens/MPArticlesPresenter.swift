//
//  MPArticlesPresenter.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 09.02.2023.
//

import Foundation

protocol MPArticlesPresenterProtocol {
    
}
 
class MPArticlesPresenter {
    
    private let model: MPArticlesModelProtocol
    
    weak var view: MPArticlesViewProtocol?
    
    init(_ view: MPArticlesViewProtocol?, model: MPArticlesModelProtocol) {
        self.view = view
        self.model = model
    }
}

// MARK: - MPArticlesPresenterProtocol
extension MPArticlesPresenter: MPArticlesPresenterProtocol {
    
}
