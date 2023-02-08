//
//  MostSharedPresenter.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import Foundation

protocol MostSharedPresenterProtocol {
    
}

class MostSharedPresenter: MostSharedPresenterProtocol {
    
    private let model: MostSharedModelProtocol
    
    weak var view: MostSharedViewProtocol?
    
    init(_ view: MostSharedViewProtocol?, model: MostSharedModelProtocol) {
        self.model = model
        self.view = view
    }
}
