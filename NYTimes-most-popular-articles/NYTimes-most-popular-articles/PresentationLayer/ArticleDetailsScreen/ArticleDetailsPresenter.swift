//
//  ArticleDetailsPresenter.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 09.02.2023.
//

import Foundation

protocol ArticleDetailsPresenterProtocol {
    
    func getArticleInformation()
    func getArticleImage()
    func didTapAddOrRemoveFromFavorites()
}

class ArticleDetailsPresenter: ArticleDetailsPresenterProtocol {

    private let model: ArticleDetailsModelProtocol
    private var article: ArticleModel
    
    weak var view: ArticleDetailsViewProtocol?
    
    init(_ view: ArticleDetailsViewProtocol?,
         model: ArticleDetailsModelProtocol, article: ArticleModel) {
        self.view = view
        self.model = model
        self.article = article
    }
    
    func getArticleImage() {
        view?.showLoading()
        
        if article.isFavorite {
            downloadImageFromLocalStorage()
        } else {
            downloadImageFromNetwork()
        }
    }
    
    func didTapAddOrRemoveFromFavorites() {
        if article.isFavorite {
            model.removeArticleFromFavorites(article: article)
            article.isFavorite = false
            view?.getScreenState(isFavorite: article.isFavorite)
        } else {
            article.isFavorite = true
            model.addArticleToFavorites(article: article)
            view?.getScreenState(isFavorite: article.isFavorite)
        }
    }
    
    func getArticleInformation() {
        view?.getScreenState(isFavorite: article.isFavorite)
        view?.setImageAuthor(author: article.media.copyright.isEmpty ? "-" : article.media.copyright)
        view?.setArticleTitle(title: article.title.isEmpty ? "-" : article.title)
        view?.setArticleAuthor(author: article.byline.isEmpty ? "-" : article.byline)
        view?.setPublishedDate(date: article.published.isEmpty ? "-" : article.published)
        view?.setUpdateDate(date: article.articleUpdated.isEmpty ? "-" : article.articleUpdated)
        view?.setArticleAbstract(abstract: article.abstract.isEmpty ? "-" : article.abstract)
        view?.setArticleSection(section: article.section.isEmpty ? "-" : article.section)
    }
    
    // MARK: - Private methods
    private func downloadImageFromLocalStorage() {
        let data = model.downloadArticleImageFromLocalStorage(by: article.media.imagePath)
        view?.showImage(with: data)
        view?.hideLoading()
    }
    
    private func downloadImageFromNetwork() {
        view?.showLoading()
        model.downloadArticleImage(by: article.media.url) { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.view?.hideLoading()
                switch result {
                case .success(let articleMediaModel):
                    self.article.media.imagePath = articleMediaModel.imagePath
                    self.article.media.mediaData = articleMediaModel.mediaData
                    self.view?.showImage(with: articleMediaModel.mediaData)
                case .failure(let error):
                    self.view?.showError(with: error.description)
                }
            }
        }
    }
}
