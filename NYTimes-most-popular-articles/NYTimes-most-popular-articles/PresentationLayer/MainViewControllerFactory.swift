//
//  MainViewControllerFactory.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import UIKit

protocol MainViewControllerFactory {
    
    func buildTabBarController() -> UITabBarController
    func buildMostEmailedVC(service: Services,
                            routes: MPArticlesPresenterRoutes) -> MPArticlesViewController
    func buildMostSharedVC(service: Services,
                           routes: MPArticlesPresenterRoutes) -> MPArticlesViewController
    func buildMostViewedVC(service: Services,
                           routes: MPArticlesPresenterRoutes) -> MPArticlesViewController
    func buildFavoritesArticlesVC(service: Services, routes: FAPresenterRoutes) -> FavoritesArticlesViewController
    
    func buildArticleDetailsVC(services: Services,
                               article: ArticleModel) -> ArticleDetailsViewController
}

// MARK: - MainViewControllerFactory
extension DependencyProvider: MainViewControllerFactory {
    
    func buildTabBarController() -> UITabBarController {
        return UITabBarController()
    }
    
    func buildMostEmailedVC(service: Services, routes: MPArticlesPresenterRoutes) -> MPArticlesViewController {
        let viewController = MPArticlesViewController()
        viewController.title = self.getScreenTitle(by: .mostEmailed)
        viewController.tabBarItem = self.getTabBarItem(by: .mostEmailed)
        let model = MPArticleModel(articleProvider: service.articleProvider,
                                   mapper: service.mapper,
                                   articleDataService: service.articleDataService,
                                   endPoint: MPArticlesRequester.emailed)
        let presenter = MPArticlesPresenter(viewController, model: model, routes: routes)
        viewController.presenter = presenter
        viewController.tableViewDataSource = MPTableViewDataSource(presenter: presenter)
        
        return viewController
    }
    
    func buildMostSharedVC(service: Services, routes: MPArticlesPresenterRoutes) -> MPArticlesViewController {
        let viewController = MPArticlesViewController()
        viewController.title = self.getScreenTitle(by: .mostShared)
        viewController.tabBarItem = self.getTabBarItem(by: .mostShared)
        let model = MPArticleModel(articleProvider: service.articleProvider,
                                   mapper: service.mapper,
                                   articleDataService: service.articleDataService,
                                   endPoint: MPArticlesRequester.shared)
        let presenter = MPArticlesPresenter(viewController, model: model, routes: routes)
        viewController.presenter = presenter
        viewController.tableViewDataSource = MPTableViewDataSource(presenter: presenter)
        
        return viewController
    }
    
    func buildMostViewedVC(service: Services, routes: MPArticlesPresenterRoutes) -> MPArticlesViewController {
        let viewController = MPArticlesViewController()
        viewController.title = self.getScreenTitle(by: .mostViewed)
        viewController.tabBarItem = self.getTabBarItem(by: .mostViewed)
        let model = MPArticleModel(articleProvider: service.articleProvider,
                                   mapper: service.mapper,
                                   articleDataService: service.articleDataService,
                                   endPoint: MPArticlesRequester.viewed)
        let presenter = MPArticlesPresenter(viewController, model: model, routes: routes)
        viewController.presenter = presenter
        viewController.tableViewDataSource = MPTableViewDataSource(presenter: presenter)
        
        return viewController
    }
    
    func buildFavoritesArticlesVC(service: Services, routes: FAPresenterRoutes) -> FavoritesArticlesViewController {
        let viewController = FavoritesArticlesViewController()
        viewController.title = self.getScreenTitle(by: .favorites)
        viewController.tabBarItem = self.getTabBarItem(by: .favorites)
        let model = FavoritesArticlesModel(articleDataService: service.articleDataService)
        let presenter = FavoritesArticlesPresenter(viewController, model: model, routes: routes)
        viewController.presenter = presenter
        viewController.tableViewDataSource = FATableViewDataSource(presenter: presenter)
        
        return viewController
    }
    
    func buildArticleDetailsVC(services: Services, article: ArticleModel) -> ArticleDetailsViewController {
        let viewController = ArticleDetailsViewController
            .instantiate(from: .ArticleDetails)
        let model = ArticleDetailsModel(articleProvider: services.articleProvider,
                                        articleDataService: services.articleDataService,
                                        fileService: services.fileService)
        let presenter = ArticleDetailsPresenter(viewController, model: model, article: article)
        viewController.presenter = presenter
        return viewController
    }
    
    // MARK: - setup components for screens 
    private func getTabBarItem(by model: ScreenModel) -> UITabBarItem {
        return UITabBarItem(title: model.title,
                            image: UIImage(systemName: model.imageName),
                            selectedImage: UIImage(systemName: model.selectedImageName))
    }
    
    private func getScreenTitle(by model: ScreenModel) -> String {
        return model.title.uppercased()
    }
}

