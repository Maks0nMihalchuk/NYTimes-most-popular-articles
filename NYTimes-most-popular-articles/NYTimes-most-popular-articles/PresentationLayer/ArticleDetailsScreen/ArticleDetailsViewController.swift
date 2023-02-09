//
//  ArticleDetailsViewController.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 09.02.2023.
//

import UIKit

protocol ArticleDetailsViewProtocol: AnyObject {
    
}

class ArticleDetailsViewController: BaseViewController {

    var presenter: ArticleDetailsPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - ArticleDetailsViewProtocol
extension ArticleDetailsViewController: ArticleDetailsViewProtocol {
    
}

// MARK: - setup UI
private extension ArticleDetailsViewController {
    
    func setupUI() {
        view.backgroundColor = .white
    }
}
