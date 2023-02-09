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
    
    var tableViewDataSource: MPTableViewDataSource?
    var presenter: MPArticlesPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBaseTableView()
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
    
    private func setupBaseTableView() {
        guard let dataSource = tableViewDataSource else {
            fatalError("CollectionViewDataSource not found")
        }
        
        setupLayoutBaseTableView()
        baseTableView.regiserCellByClass(cellClass: ArticleTableViewCell.self)
        baseTableView.dataSource = dataSource
    }
}
