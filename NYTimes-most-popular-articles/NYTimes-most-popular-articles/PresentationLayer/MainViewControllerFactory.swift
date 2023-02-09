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
    func buildFavoritesArticlesVC(service: Services) -> FavoritesArticlesViewController
    
    func buildArticleDetailsVC(services: Services) -> ArticleDetailsViewController
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
        let model = MostEmailedModel(articleProvider: service.articleProvider)
        let presenter = MPArticlesPresenter(viewController, model: model, routes: routes)
        viewController.presenter = presenter
        viewController.tableViewDataSource = MPTableViewDataSource(presenter: presenter)
        
        return viewController
    }
    
    func buildMostSharedVC(service: Services, routes: MPArticlesPresenterRoutes) -> MPArticlesViewController {
        let viewController = MPArticlesViewController()
        viewController.title = self.getScreenTitle(by: .mostShared)
        viewController.tabBarItem = self.getTabBarItem(by: .mostShared)
        let model = MostSharedModel(articleProvider: service.articleProvider)
        let presenter = MPArticlesPresenter(viewController, model: model, routes: routes)
        viewController.presenter = presenter
        viewController.tableViewDataSource = MPTableViewDataSource(presenter: presenter)
        
        return viewController
    }
    
    func buildMostViewedVC(service: Services, routes: MPArticlesPresenterRoutes) -> MPArticlesViewController {
        let viewController = MPArticlesViewController()
        viewController.title = self.getScreenTitle(by: .mostViewed)
        viewController.tabBarItem = self.getTabBarItem(by: .mostViewed)
        let model = MostViewedModel(articleProvider: service.articleProvider)
        let presenter = MPArticlesPresenter(viewController, model: model, routes: routes)
        viewController.presenter = presenter
        viewController.tableViewDataSource = MPTableViewDataSource(presenter: presenter)
        
        return viewController
    }
    
    func buildFavoritesArticlesVC(service: Services) -> FavoritesArticlesViewController {
        let viewController = FavoritesArticlesViewController()
        viewController.title = self.getScreenTitle(by: .favorites)
        viewController.tabBarItem = self.getTabBarItem(by: .favorites)
        let model = FavoritesArticlesModel()
        let presenter = FavoritesArticlesPresenter(viewController, model: model)
        viewController.presenter = presenter
        
        return viewController
    }
    
    func buildArticleDetailsVC(services: Services) -> ArticleDetailsViewController {
        let viewController = ArticleDetailsViewController()
        let model = ArticleDetailsModel()
        let presenter = ArticleDetailsPresenter(viewController, model: model)
        viewController.presenter = presenter
        return viewController
    }
    
    // MARK: - setup components for screens 
    private func getTabBarItem(by model: ScreenModel) -> UITabBarItem {
        return UITabBarItem(title: model.title,
                            image: UIImage(systemName: model.imageName),
                            selectedImage: UIImage(systemName: model.selectedImageName))
    }
    
    func getScreenTitle(by model: ScreenModel) -> String {
        return model.title.uppercased()
    }
}

