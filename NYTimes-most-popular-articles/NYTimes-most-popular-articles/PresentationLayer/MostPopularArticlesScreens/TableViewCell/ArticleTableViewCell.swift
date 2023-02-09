//
//  ArticleTableViewCell.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 09.02.2023.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var articleTitleLabel: UILabel!
    
    @IBOutlet private weak var articleAuthorLabel: UILabel!
    // MARK: - Public method for configure cell
    
    func configureCell(with articleTitle: String, author: String) {
        articleTitleLabel.text = articleTitle
        articleAuthorLabel.text = "Author(s): \(author)"
    }
}
