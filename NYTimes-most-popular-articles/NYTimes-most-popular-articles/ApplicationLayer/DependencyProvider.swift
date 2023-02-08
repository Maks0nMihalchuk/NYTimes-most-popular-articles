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
    
    func buildMostEmailedVC(service: Services) -> MostEmailedViewController {
        let viewController = MostEmailedViewController.instantiate(from: .MostEmailed)
        let model = MostEmailedModel()
        let presenter = MostEmailedPresenter(viewController, model: model)
        viewController.presenter = presenter
        
        return viewController
    }
    
    func buildMostSharedVC(service: Services) -> MostSharedViewController {
        let viewController = MostSharedViewController.instantiate(from: .MostShared)
        let model = MostSharedModel()
        let presenter = MostSharedPresenter(viewController, model: model)
        viewController.presenter = presenter
        
        return viewController
    }
    
    func buildMostViewedVC(service: Services) -> MostViewedViewController {
        let viewController = MostViewedViewController.instantiate(from: .MostViewed)
        let model = MostViewedModel()
        let presenter = MostViewedPresenter(viewController, model: model)
        viewController.presenter = presenter
        
        return viewController
    }
    
    func buildFavoritesArticlesVC(service: Services) -> FavoritesArticlesViewController {
        let viewController = FavoritesArticlesViewController.instantiate(from: .FavoritesArticles)
        let model = FavoritesArticlesModel()
        let presenter = FavoritesArticlesPresenter(viewController, model: model)
        viewController.presenter = presenter
        
        return viewController
    }
}
