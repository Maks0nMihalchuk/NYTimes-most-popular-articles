//
//  FavoritesArticlesViewController.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import UIKit

protocol FavoritesArticlesViewProtocol: AnyObject {
    
    func showViewAccording(to state: FavoritesScreenState)
    func reloadTableView()
}

class FavoritesArticlesViewController: BaseViewController {
    
    private enum Constants {
        static let textForBaseView = "You have not added any articles to favorites yet!"
        static let labelLeadingConstant: CGFloat = 20
        static let labelTrailingConstant: CGFloat = -20
        static let fontSize: CGFloat = 22
    }
    
    private var listOfFavoritesIsEmptyLabel: UILabel!
    
    var presenter: FavoritesArticlesPresenterProtocol?
    var tableViewDataSource: FATableViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupListOfFavoritesIsEmptyLabel()
        setupBaseTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.checkIfListOfFavoritesIsEmpty()
    }
}

// MARK: - FavoritesArticlesViewProtocol
extension FavoritesArticlesViewController: FavoritesArticlesViewProtocol {
    
    func showViewAccording(to state: FavoritesScreenState) {
        switch state {
        case .empty:
            hideBaseTableView()
            showListOfFavoritesIsEmptyLabel()
        case .notEmpty:
            hideListOfFavoritesIsEmptyLabel()
            showBaseTableView()
        }
    }
    
    func reloadTableView() {
        baseTableView.reloadData()
    }
}

// MARK: - setup UI
private extension FavoritesArticlesViewController {
    
    func setupUI() {
        view.backgroundColor = .white
    }
    
    func hideBaseTableView() {
        baseTableView.isHidden = true
    }
    
    func hideListOfFavoritesIsEmptyLabel() {
        listOfFavoritesIsEmptyLabel.isHidden = true
    }
    
    func showBaseTableView() {
        baseTableView.isHidden = false
    }
    
    func showListOfFavoritesIsEmptyLabel() {
        listOfFavoritesIsEmptyLabel.isHidden = false
    }
    
    func setupBaseTableView() {
        guard let dataSource = tableViewDataSource else {
            fatalError("CollectionViewDataSource not found")
        }
        
        setupLayoutBaseTableView()
        baseTableView.regiserCellByClass(cellClass: FATableViewCell.self)
        baseTableView.dataSource = dataSource
        baseTableView.delegate = dataSource
    }
    
    func setupListOfFavoritesIsEmptyLabel() {
        
        listOfFavoritesIsEmptyLabel = UILabel(frame: .zero)
        listOfFavoritesIsEmptyLabel.numberOfLines = .zero
        listOfFavoritesIsEmptyLabel.textAlignment = .center
        listOfFavoritesIsEmptyLabel.textColor = .darkGray
        listOfFavoritesIsEmptyLabel.text = Constants.textForBaseView
        listOfFavoritesIsEmptyLabel.font = .systemFont(ofSize: Constants.fontSize,
                                                       weight: .semibold,
                                                       width: .standard)
        setupLayoutListOfFavoritesIsEmptyLabel()
    }
    
    func setupLayoutListOfFavoritesIsEmptyLabel() {
        view.addSubview(listOfFavoritesIsEmptyLabel)
        listOfFavoritesIsEmptyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            listOfFavoritesIsEmptyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.labelLeadingConstant),
            listOfFavoritesIsEmptyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.labelTrailingConstant),
            listOfFavoritesIsEmptyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            listOfFavoritesIsEmptyLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}


