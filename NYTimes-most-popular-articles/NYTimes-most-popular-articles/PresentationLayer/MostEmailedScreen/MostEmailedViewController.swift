//
//  MostEmailedViewController.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import UIKit

protocol MostEmailedViewProtocol: AnyObject {
    
}

class MostEmailedViewController: BaseViewController {
    
    var presenter: MostEmailedPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBaseCollectionView()
    }
}

// MARK: - MostEmailedViewProtocol
extension MostEmailedViewController: MostEmailedViewProtocol {
    
}
