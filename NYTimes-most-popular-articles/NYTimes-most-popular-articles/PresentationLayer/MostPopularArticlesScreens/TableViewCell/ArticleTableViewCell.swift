//
//  ArticleTableViewCell.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 09.02.2023.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var favoriteImageView: UIImageView!
    @IBOutlet private weak var articleTitleLabel: UILabel!
    
    @IBOutlet private weak var articleAuthorLabel: UILabel!
    
    // MARK: - Public method for configure cell
    
    override func prepareForReuse() {
//        favoriteImageView.isHidden = true
    }
    
    func configureCell(with articleTitle: String, author: String, isFavorite: Bool) {
        articleTitleLabel.text = articleTitle
        articleAuthorLabel.text = author
        favoriteImageView.isHidden = !isFavorite
    }
}
