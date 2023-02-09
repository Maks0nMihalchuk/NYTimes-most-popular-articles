//
//  MPArticlesViewController.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 09.02.2023.
//

import UIKit

protocol MPArticlesViewProtocol: AnyObject {
    
}

class MPArticlesViewController: BaseViewController {
    
    var presenter: MPArticlesPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBaseCollectionView()
    }
}

// MARK: - MPArticlesViewProtocol
extension MPArticlesViewController: MPArticlesViewProtocol {
    
}

// MARK: - setup UI
private extension MPArticlesViewController {
    
    private func setupUI() {
        view.backgroundColor = .white
    }
}
