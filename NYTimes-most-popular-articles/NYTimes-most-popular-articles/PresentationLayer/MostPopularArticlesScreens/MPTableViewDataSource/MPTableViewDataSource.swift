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
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCellBy(cellClass: ArticleTableViewCell.self, indexPath: indexPath)
        cell.configureCell(with: "The Crypto Collapse and the End of the Magical Thinking That Infected Capitalism")

        return  cell
    }
}
