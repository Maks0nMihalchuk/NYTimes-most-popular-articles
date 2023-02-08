//
//  MostViewedViewController.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import UIKit

protocol MostViewedViewProtocol: AnyObject {
    
}

class MostViewedViewController: BaseViewController {
    
    var presenter: MostViewedPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBaseCollectionView()
    }
}

// MARK: - MostViewedViewProtocol
extension MostViewedViewController: MostViewedViewProtocol {
    
}

// MARK: - setup UI
private extension MostViewedViewController {
    
    private func setupUI() {
        view.backgroundColor = .white
    }
}
