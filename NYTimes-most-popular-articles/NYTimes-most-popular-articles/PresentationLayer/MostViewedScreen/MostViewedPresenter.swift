//
//  MostViewedPresenter.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import Foundation

protocol MostViewedPresenterProtocol {
    
}

class MostViewedPresenter: MostViewedPresenterProtocol {
    
    private let model: MostViewedModelProtocol
    
    weak var view: MostViewedViewProtocol?
    
    init(_ view: MostViewedViewProtocol?, model: MostViewedModelProtocol) {
        self.model = model
        self.view = view
    }
}
