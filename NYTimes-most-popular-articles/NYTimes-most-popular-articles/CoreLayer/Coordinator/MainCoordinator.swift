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
    
    // MARK: - Public method
    func start() {
        showTabBarController()
    }
    
    // MARK: - Private method
    
    private func showTabBarController() {
        let controller = factory.buildTabBarController()
        let controllers = [getMostEmailedViewController(), getMostSharedViewController(), getMostViewedViewController(), getFavoritesArticlesViewController()]
        controller.viewControllers = controllers
        self.setRoot(controller, hideBar: true)
    }
    
    private func getMostEmailedViewController() -> UINavigationController {
        let controller = factory.buildMostEmailedVC(service: services)
        return UINavigationController(rootViewController: controller)
    }
    
    private func getMostSharedViewController() -> UINavigationController {
        let controller = factory.buildMostSharedVC(service: services)
        return UINavigationController(rootViewController: controller)
    }
    
    private func getMostViewedViewController() -> UINavigationController {
        let controller = factory.buildMostViewedVC(service: services)
        return UINavigationController(rootViewController: controller)
    }
    
    func getFavoritesArticlesViewController() -> UINavigationController {
        let controller = factory.buildFavoritesArticlesVC(service: services)
        return UINavigationController(rootViewController: controller)
    }
    
    // MARK: - Init
    init(rootController: UINavigationController, factory: Factory, services: Services) {
        self.childCoordinators = []
        self.rootController = rootController
        self.factory = factory
        self.services = services
    }
}
