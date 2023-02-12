//
//  MainCoordinator.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import UIKit

final class MainCoordinator: Coordinator {
    
    private let factory: Factory
    private let services: Services
    
    var childCoordinators: [Coordinator]
    var rootController: UINavigationController
    
    private var mostEmailedViewController: UINavigationController?
    private var mostSharedViewController: UINavigationController?
    private var mostViewedViewController: UINavigationController?
    private var favoritesArticleViewController: UINavigationController?
    
    // MARK: - Public method
    func start() {
        showTabBarController()
    }
    
    // MARK: - Private method
    
    // MARK: - show ViewControllers
    private func showTabBarController() {
        let controller = factory.buildTabBarController()
        let controllers = [getMostEmailedViewController(), getMostSharedViewController(), getMostViewedViewController(), getFavoritesArticlesViewController()]
        controller.viewControllers = controllers
        self.setRoot(controller, hideBar: true)
    }
    
    private func showArticleDetailsViewController(for article: ArticleModel,
                                                  from: UINavigationController?) {
        let controller = factory.buildArticleDetailsVC(services: services,
                                                       article: article)
        from?.pushViewController(controller, animated: true)
    }
    
    // MARK: - get ViewControllers for tabBar
    private func getMostEmailedViewController() -> UINavigationController {
        let routes = MPArticlesPresenterRoutes { [unowned self] article in
            self.showArticleDetailsViewController(for: article,
                                                  from: mostEmailedViewController)
        }
        
        let controller = factory.buildMostEmailedVC(service: services,
                                                    routes: routes)
        let navController = UINavigationController(rootViewController: controller)
        self.mostEmailedViewController = navController
        
        return navController
    }
    
    private func getMostSharedViewController() -> UINavigationController {
        let routes = MPArticlesPresenterRoutes { [unowned self] article in
            self.showArticleDetailsViewController(for: article,
                                                  from: mostSharedViewController)
        }
        
        let controller = factory.buildMostSharedVC(service: services,
                                                   routes: routes)
        let navController = UINavigationController(rootViewController: controller)
        self.mostSharedViewController = navController
        
        return navController
    }
    
    private func getMostViewedViewController() -> UINavigationController {
        let routes = MPArticlesPresenterRoutes { [unowned self] article in
            self.showArticleDetailsViewController(for: article,
                                                  from: mostViewedViewController)
        }
        
        let controller = factory.buildMostViewedVC(service: services,
                                                   routes: routes)
        let navController = UINavigationController(rootViewController: controller)
        self.mostViewedViewController = navController
        
        return navController
    }
    
    private func getFavoritesArticlesViewController() -> UINavigationController {
        let routes = FAPresenterRoutes { [unowned self] article in
            self.showArticleDetailsViewController(for: article,
                                                  from: favoritesArticleViewController)
        }
        let controller = factory.buildFavoritesArticlesVC(service: services,
                                                          routes: routes)
        let navController = UINavigationController(rootViewController: controller)
        self.favoritesArticleViewController = navController

        return navController
    }
    
    // MARK: - Init
    init(rootController: UINavigationController, factory: Factory, services: Services) {
        self.childCoordinators = []
        self.rootController = rootController
        self.factory = factory
        self.services = services
    }
}
