//
//  ArticleDetailsPresenter.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 09.02.2023.
//

import Foundation

//struct ArticleDetailsPresenterRoutes {
//    var onBack: VoidBlock
//}

protocol ArticleDetailsPresenterProtocol {
    
}

class ArticleDetailsPresenter: ArticleDetailsPresenterProtocol {

    private let model: ArticleDetailsModelProtocol
    
    weak var view: ArticleDetailsViewProtocol?
    
    init(_ view: ArticleDetailsViewProtocol?,
         model: ArticleDetailsModelProtocol) {
        self.view = view
        self.model = model
    }
}
