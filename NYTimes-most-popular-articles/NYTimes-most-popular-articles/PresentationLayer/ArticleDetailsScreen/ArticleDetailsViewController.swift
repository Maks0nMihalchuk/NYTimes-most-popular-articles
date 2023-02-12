//
//  ArticleDetailsViewController.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 09.02.2023.
//

import UIKit

protocol ArticleDetailsViewProtocol: AnyObject {
    
    func showLoading()
    func hideLoading()
    func showImage(with data: Data?)
    func showError(with message: String)
    
    func getScreenState(isFavorite: Bool)
    func setImageAuthor(author: String)
    func setArticleTitle(title: String)
    func setArticleAuthor(author: String)
    func setPublishedDate(date: String)
    func setUpdateDate(date: String)
    func setArticleAbstract(abstract: String)
    func setArticleSection(section: String)
}

class ArticleDetailsViewController: BaseViewController {
    
    private enum Constants {
        static let buttonCornerRadius: CGFloat = 10
        static let duration: CGFloat = 0.3
        static let fullAlpa: CGFloat = 1
        static let isNotFavoritesText = "Add to Favorites"
        static let isFavoritesText = "Remove from Favorites"
    }

    @IBOutlet weak var imageDownloadIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var articlePlaceholderImageView: UIImageView!
    @IBOutlet weak var articleImageView: UIImageView!

    @IBOutlet weak var imageAuthorPlaceholderLabel: UILabel!
    @IBOutlet weak var imageAuthorLabel: UILabel!
    
    @IBOutlet weak var articleTitlePlaceholderLabel: UILabel!
    @IBOutlet weak var articleTitleLabel: UILabel!
    
    @IBOutlet weak var articleAuthorPlaceholderLabel: UILabel!
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
        setupUI()
        presenter?.getArticleInformation()
        presenter?.getArticleImage()
    }
    
    @IBAction private func didTapAddOrRemoveFromFavoritesButton(_ sender: UIButton) {
        presenter?.didTapAddOrRemoveFromFavorites()
    }
    
    private func setupUI() {
        addOrRemoveFromFavoritesButton.rounded(Constants.buttonCornerRadius)
    }
}

// MARK: - ArticleDetailsViewProtocol
extension ArticleDetailsViewController: ArticleDetailsViewProtocol {
    
    func showLoading() {
        imageDownloadIndicatorView.startAnimating()
    }
    
    func hideLoading() {
        imageDownloadIndicatorView.stopAnimating()
    }
    
    func showError(with message: String) {
        UIAlertController.showErrorAlert(message: message)
    }
    
    func getScreenState(isFavorite: Bool) {
        let title = isFavorite ? Constants.isFavoritesText : Constants.isNotFavoritesText
        let color: UIColor = isFavorite ? .systemRed : .systemBlue
        addOrRemoveFromFavoritesButton.setTitle(title, for: .normal)
        addOrRemoveFromFavoritesButton.backgroundColor = color
    }
    
    func setImageAuthor(author: String) {
        imageAuthorLabel.text = author
    }
    
    func setArticleTitle(title: String) {
        articleTitleLabel.text = title
    }
    
    func setArticleAuthor(author: String) {
        articleAuthorLabel.text = author
    }
    
    func setPublishedDate(date: String) {
        articlePublishedLabel.text = date
    }

    func setUpdateDate(date: String) {
        articleUpdateLabel.text = date
    }
    
    func setArticleAbstract(abstract: String) {
        articleAbstractLabel.text = abstract
    }
    
    func setArticleSection(section: String) {
        articleSectionLabel.text = section
    }
    
    func showImage(with data: Data?) {
        guard let data = data, !data.isEmpty else { return }
        
        UIView.animate(withDuration: Constants.duration) { [weak self] in
            guard let self = self else { return }
            
            let image = UIImage(data: data)
            self.articleImageView.image = image
            self.articlePlaceholderImageView.alpha = .zero
            self.articleImageView.alpha = Constants.fullAlpa
        }
    }
}
