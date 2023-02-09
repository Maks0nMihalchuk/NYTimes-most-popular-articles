//
//  ArticleCollectionViewCell.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import UIKit

class ArticleCollectionViewCell: UICollectionViewCell, Reusable {

    @IBOutlet private weak var articleTitle: UILabel!
    

    func configureCell(with articleTitle: String) {
        self.articleTitle.text = articleTitle
    }
}
