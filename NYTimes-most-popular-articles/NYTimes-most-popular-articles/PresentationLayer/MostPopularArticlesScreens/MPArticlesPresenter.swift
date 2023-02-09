//
//  MPArticlesPresenter.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 09.02.2023.
//

import Foundation

protocol MPArticlesPresenterProtocol {
    
    func sendDataRequest()
}
 
class MPArticlesPresenter {
    
    private let model: MPArticlesModelProtocol
    
    weak var view: MPArticlesViewProtocol?
    
    init(_ view: MPArticlesViewProtocol?, model: MPArticlesModelProtocol) {
        self.view = view
        self.model = model
    }
    
    func sendDataRequest() {
        model.getArticles { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let articles):
                    break
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
