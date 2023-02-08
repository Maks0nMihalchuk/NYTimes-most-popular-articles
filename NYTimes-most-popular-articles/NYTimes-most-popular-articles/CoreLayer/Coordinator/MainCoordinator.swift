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
        self.setRoot(controller, hideBar: true)
    }
    
    // MARK: - Init
    init(rootController: UINavigationController, factory: Factory, services: Services) {
        self.childCoordinators = []
        self.rootController = rootController
        self.factory = factory
        self.services = services
    }
}
