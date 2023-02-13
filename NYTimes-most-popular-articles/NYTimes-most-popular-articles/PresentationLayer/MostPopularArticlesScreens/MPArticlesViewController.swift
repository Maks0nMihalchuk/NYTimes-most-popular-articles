//
//  MPArticlesViewController.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 09.02.2023.
//

import UIKit

protocol MPArticlesViewProtocol: AnyObject {
    
    func endRefreshing()
    func showLoading()
    func hideLoading()
    func reloadView()
    func showError(with message: String)
}

class MPArticlesViewController: BaseViewController {
    
    private var refreshControl: UIRefreshControl?

    var tableViewDataSource: MPTableViewDataSource?
    var presenter: MPArticlesPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBaseTableView()
        presenter?.sendNetworkRequest(isRefresh: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.syncDataWithLocalStorage()
    }
    
    @objc private func didPullToRefresh() {
        presenter?.sendNetworkRequest(isRefresh: true)
    }
}

// MARK: - MPArticlesViewProtocol
extension MPArticlesViewController: MPArticlesViewProtocol {
    
    func showLoading() {
        showLoadingView()
    }
    
    func hideLoading() {
        hideLoadingView()
    }
    
    func reloadView() {
        baseTableView.reloadData()
    }
    
    func showError(with message: String) {
        UIAlertController.showErrorAlert(message: message)
    }
    
    func endRefreshing() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.baseTableView.refreshControl?.endRefreshing()
        }
    }
}

// MARK: - setup UI
private extension MPArticlesViewController {
    
    func setupUI() {
        view.backgroundColor = .white
    }
    
    func setupBaseTableView() {
        guard let dataSource = tableViewDataSource else {
            fatalError("CollectionViewDataSource not found")
        }
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        setupLayoutBaseTableView()
        baseTableView.regiserCellByClass(cellClass: ArticleTableViewCell.self)
        baseTableView.dataSource = dataSource
        baseTableView.delegate = dataSource
        baseTableView.refreshControl = refreshControl
    }
}
