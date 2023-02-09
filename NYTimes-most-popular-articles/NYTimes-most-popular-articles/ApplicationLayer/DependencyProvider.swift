//
//  DependencyProvider.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import UIKit

typealias Factory = CoordinatorFactoryProtocol & ViewControllerFactory
typealias ViewControllerFactory = MainViewControllerFactory

final class DependencyProvider {
    
    private let rootController: UINavigationController
    
    private lazy var services = Services()
    private lazy var appCoordinator = self.buildAppCoordinator(services: services)
    
    // MARK: - Public method
    func start() {
        self.appCoordinator.start()
    }
    
    // MARK: - Init
    init(rootController: UINavigationController) {
        self.rootController = rootController
    }
}

// MARK: - CoordinatorFactoryProtocol
extension DependencyProvider: CoordinatorFactoryProtocol {
    
    func buildAppCoordinator(services: Services) -> AppCoordinator {
        return AppCoordinator(rootController: rootController,
                              factory: self,
                              services: services)
    }
    
    func buildMainCoordinator(services: Services) -> MainCoordinator {
        return MainCoordinator(rootController: rootController,
                               factory: self,
                               services: services)
    }
}

// MARK: - MainViewControllerFactory
extension DependencyProvider: MainViewControllerFactory {
    
    func buildTabBarController() -> UITabBarController {
        return UITabBarController()
    }
    
    func buildMostEmailedVC(service: Services) -> MPArticlesViewController {
        let viewController = MPArticlesViewController()
        let tabBarImage = UIImage(systemName: "list.bullet.rectangle")
        let selectedTabBarImage = UIImage(systemName: "list.bullet.rectangle.fill")
        viewController.title = "Most Emailed".uppercased()
        viewController.tabBarItem = .init(title: "Most emailed",
                                          image: tabBarImage,
                                          selectedImage: selectedTabBarImage)
        let model = MostEmailedModel(articleProvider: services.articleProvider)
        let presenter = MPArticlesPresenter(viewController, model: model)
        viewController.presenter = presenter
        viewController.tableViewDataSource = MPTableViewDataSource(presenter: presenter)
        
        return viewController
    }
    
    func buildMostSharedVC(service: Services) -> MPArticlesViewController {
        let viewController = MPArticlesViewController()
        let tabBarImage = UIImage(systemName: "square.and.arrow.up")
        let selectedTabBarImage = UIImage(systemName: "square.and.arrow.up.fill")
        viewController.title = "Most Shared".uppercased()
        viewController.tabBarItem = .init(title: "Most shared",
                                          image: tabBarImage,
                                          selectedImage: selectedTabBarImage)
        let model = MostSharedModel(articleProvider: services.articleProvider)
        let presenter = MPArticlesPresenter(viewController, model: model)
        viewController.presenter = presenter
        viewController.tableViewDataSource = MPTableViewDataSource(presenter: presenter)
        
        return viewController
    }
    
    func buildMostViewedVC(service: Services) -> MPArticlesViewController {
        let tabBarImage = UIImage(systemName: "viewfinder.circle")
        let selectedTabBarImage = UIImage(systemName: "viewfinder.circle.fill")
        let viewController = MPArticlesViewController()
        viewController.title = "Most Viewed".uppercased()
        viewController.tabBarItem = .init(title: "Most viewed",
                                          image: tabBarImage,
                                          selectedImage: selectedTabBarImage)
        let model = MostViewedModel(articleProvider: services.articleProvider)
        let presenter = MPArticlesPresenter(viewController, model: model)
        viewController.presenter = presenter
        viewController.tableViewDataSource = MPTableViewDataSource(presenter: presenter)
        
        return viewController
    }
    
    func buildFavoritesArticlesVC(service: Services) -> FavoritesArticlesViewController {
        let tabBarImage = UIImage(systemName: "star")
        let selectedTabBarImage = UIImage(systemName: "star.fill")
        let viewController = FavoritesArticlesViewController()
        viewController.tabBarItem = .init(title: "Favorites",
                                          image: tabBarImage,
                                          selectedImage: selectedTabBarImage)
        let model = FavoritesArticlesModel()
        let presenter = FavoritesArticlesPresenter(viewController, model: model)
        viewController.presenter = presenter
        
        return viewController
    }
}
