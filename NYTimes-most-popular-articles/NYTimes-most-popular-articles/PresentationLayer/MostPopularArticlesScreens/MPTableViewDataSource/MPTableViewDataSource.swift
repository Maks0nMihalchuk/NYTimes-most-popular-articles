//
//  MPTableViewDataSource.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 09.02.2023.
//

import UIKit

class MPTableViewDataSource: NSObject {

    private let presenter: MPArticlesPresenterProtocol
    
    // MARK: - Init
    init(presenter: MPArticlesPresenterProtocol) {
        self.presenter = presenter
    }
}

// MARK: - UITableViewDataSource
extension MPTableViewDataSource: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNumberOfArticles()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCellBy(cellClass: ArticleTableViewCell.self, indexPath: indexPath)
        let article = presenter.getArticlesByIndex(indexPath.row)
        cell.configureCell(with: article.title, author: article.byline)

        return  cell
    }
}
