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

    @IBOutlet weak var imageDownloadIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var articlePlaceholderImageView: UIImageView!
    @IBOutlet weak var articleImageView: UIImageView!

    @IBOutlet weak var imageAuthorPlaceholderLabel: UILabel!
    @IBOutlet weak var imageAuthorLabel: UILabel!
    
    @IBOutlet weak var articleTitlePlaceholderLabel: UILabel!
    @IBOutlet weak var articleAuthorLabel: UILabel!
    
    @IBOutlet weak var articlePublishedPlaceholderLabel: UILabel!
    @IBOutlet weak var articlePublishedLabel: UILabel!
    
    @IBOutlet weak var articleUpdatePlaceholderLabel: UILabel!
    @IBOutlet weak var articleUpdateLabel: UILabel!
    
    @IBOutlet weak var articleAbstractPlaceholderLabel: UILabel!
    @IBOutlet weak var articleAbstractLabel: UILabel!
    
    @IBOutlet weak var articleSectionPlaceholderLabel: UILabel!
    @IBOutlet weak var articleSectionLabel: UILabel!
    
    @IBOutlet weak var addOrRemoveFromFavoritesButton: UIButton!
    
    var presenter: ArticleDetailsPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction private func didTapAddOrRemoveFromFavoritesButton(_ sender: UIButton) {
        
    }
    
}

// MARK: - ArticleDetailsViewProtocol
extension ArticleDetailsViewController: ArticleDetailsViewProtocol {
    
}

// MARK: - setup UI
private extension ArticleDetailsViewController {
    

}
