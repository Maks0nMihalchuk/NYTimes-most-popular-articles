//
//  AppCoordinator.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    private let factory: Factory
    private let services: Services
    
    var childCoordinators: [Coordinator]
    var rootController: UINavigationController
    
    // MARK: - Public method
    func start() {
        runMainFlow()
    }

    // MARK: - Private method
    private func runMainFlow() {
        let coordinator = factory.buildMainCoordinator(services: services)
        self.addChild(coordinator: coordinator)
        coordinator.start()
    }
    
    // MARK: - Init
    init(rootController: UINavigationController, factory: Factory, services: Services) {
        self.childCoordinators = []
        self.rootController = rootController
        self.factory = factory
        self.services = services
    }
}

