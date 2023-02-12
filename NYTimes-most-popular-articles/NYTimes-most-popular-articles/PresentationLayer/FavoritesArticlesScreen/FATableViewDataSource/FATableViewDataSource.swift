//
//  FATableViewDataSource.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 12.02.2023.
//

import UIKit

class FATableViewDataSource: NSObject {

    private let presenter: FavoritesArticlesPresenterProtocol
    
    // MARK: - Init
    init(presenter: FavoritesArticlesPresenterProtocol) {
        self.presenter = presenter
    }
}

// MARK: - UITableViewDataSource
extension FATableViewDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNumberOfArticles()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCellBy(cellClass: FATableViewCell.self,
                                           indexPath: indexPath)
        let article = presenter.getArticlesByIndex(indexPath.row)
        cell.configureCell(with: article.title, author: article.byline)
        return  cell
    }
}

// MARK: - UITableViewDelegate
extension FATableViewDataSource: UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.showArticleDetails(by: indexPath.row)
    }
}
