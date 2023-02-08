//
//  MostEmailedPresenter.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import Foundation

protocol MostEmailedPresenterProtocol {
    
}

class MostEmailedPresenter: MostEmailedPresenterProtocol {
    
    private let model: MostEmailedModelProtocol
    
    weak var view: MostEmailedViewProtocol?
    
    init(_ view: MostEmailedViewProtocol?, model: MostEmailedModelProtocol) {
        self.model = model
        self.view = view
    }
}
