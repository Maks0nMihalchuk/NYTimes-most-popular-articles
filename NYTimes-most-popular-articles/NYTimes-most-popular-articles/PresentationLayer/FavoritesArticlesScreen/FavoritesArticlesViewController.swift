//
//  FavoritesArticlesViewController.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import UIKit

protocol FavoritesArticlesViewProtocol: AnyObject {
    
}

class FavoritesArticlesViewController: BaseViewController {
    
    var presenter: FavoritesArticlesPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBaseCollectionView()
    }
}

// MARK: - FavoritesArticlesViewProtocol
extension FavoritesArticlesViewController: FavoritesArticlesViewProtocol {
    
}

// MARK: - setup UI
private extension FavoritesArticlesViewController {
    
    private func setupUI() {
        view.backgroundColor = .white
    }
}
