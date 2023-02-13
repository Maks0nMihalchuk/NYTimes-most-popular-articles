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

