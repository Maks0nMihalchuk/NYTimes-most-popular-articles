//
//  ArticleDetailsPresenter.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 09.02.2023.
//

import Foundation

//struct ArticleDetailsPresenterRoutes {
//    var onBack: VoidBlock
//}

protocol ArticleDetailsPresenterProtocol {
    
    func downloadImage()
    func getArticleInformation()
}

class ArticleDetailsPresenter: ArticleDetailsPresenterProtocol {

    private let model: ArticleDetailsModelProtocol
    
    weak var view: ArticleDetailsViewProtocol?
    
    init(_ view: ArticleDetailsViewProtocol?,
         model: ArticleDetailsModelProtocol) {
        self.view = view
        self.model = model
    }
    
    func getArticleInformation() {
        let article = model.getArticleInformation()
        
        view?.getScreenState(isFavorite: article.isFavorite)
        view?.setImageAuthor(author: article.media.copyright.isEmpty ? "-" : article.media.copyright)
        view?.setArticleTitle(title: article.title.isEmpty ? "-" : article.title)
        view?.setArticleAuthor(author: article.byline.isEmpty ? "-" : article.byline)
        view?.setPublishedDate(date: article.publishedDate.isEmpty ? "-" : article.publishedDate)
        view?.setUpdateDate(date: article.updated.isEmpty ? "-" : article.updated)
        view?.setArticleAbstract(abstract: article.abstract.isEmpty ? "-" : article.abstract)
        view?.setArticleSection(section: article.section.isEmpty ? "-" : article.section)
    }
    
    func downloadImage() {
        view?.showLoading()
        model.downloadArticleImage { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.view?.hideLoading()
                
                switch result {
                case .success(let data):
                    self.view?.showImage(with: data)
                case .failure(let error):
                    self.view?.showError(with: error.description)
                }
                
            }
        }
    }
}
