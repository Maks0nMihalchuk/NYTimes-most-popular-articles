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
        static let buttonTitleSize: CGFloat = 20
        static let isNotFavoritesText = "Add to Favorites"
        static let isFavoritesText = "Remove from Favorites"
    }

    @IBOutlet private weak var imageDownloadIndicatorView: UIActivityIndicatorView!
    @IBOutlet private weak var articlePlaceholderImageView: UIImageView!
    @IBOutlet private weak var articleImageView: UIImageView!

    @IBOutlet private weak var imageAuthorPlaceholderLabel: UILabel!
    @IBOutlet private weak var imageAuthorLabel: UILabel!
    
    @IBOutlet private weak var articleTitlePlaceholderLabel: UILabel!
    @IBOutlet private weak var articleTitleLabel: UILabel!
    
    @IBOutlet private weak var articleAuthorPlaceholderLabel: UILabel!
    @IBOutlet private weak var articleAuthorLabel: UILabel!
    
    @IBOutlet private weak var articlePublishedPlaceholderLabel: UILabel!
    @IBOutlet private weak var articlePublishedLabel: UILabel!
    
    @IBOutlet private weak var articleUpdatePlaceholderLabel: UILabel!
    @IBOutlet private weak var articleUpdateLabel: UILabel!
    
    @IBOutlet private weak var articleAbstractPlaceholderLabel: UILabel!
    @IBOutlet private weak var articleAbstractLabel: UILabel!
    
    @IBOutlet private weak var articleSectionPlaceholderLabel: UILabel!
    @IBOutlet private weak var articleSectionLabel: UILabel!
    
    @IBOutlet private weak var addOrRemoveFromFavoritesButton: UIButton!
    
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
        let font = UIFont.systemFont(ofSize: Constants.buttonTitleSize, weight: .semibold)
        let attributedTitle = NSAttributedString(string: title,
                                                 attributes: [.font: font])
        addOrRemoveFromFavoritesButton.setAttributedTitle(attributedTitle, for: .normal)
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
