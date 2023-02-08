//
//  Coordinator.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import UIKit

protocol Coordinator: AnyObject {
    
    var childCoordinators: [Coordinator] { get set }
    var rootController: UINavigationController { get set }
    
    func start()
}

// MARK: - Methods to work with child coordinators
extension Coordinator {
    
    func addChild(coordinator: Coordinator) {
        self.childCoordinators.append(coordinator)
    }
    
    func removeChild(coordinator: Coordinator) {
        guard childCoordinators.isEmpty == false else { return }
        
        for (index, element) in childCoordinators.enumerated() {
            if element === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}

// MARK: - Coordinator Routing Methods
extension Coordinator {
    
    func present(_ viewController: UIViewController, animated: Bool = true) {
        self.rootController.present(viewController, animated: animated)
    }
    
    func present(_ viewController: UIViewController, animated: Bool = true,
                 modalPresentationSytle: UIModalPresentationStyle) {
        viewController.modalPresentationStyle = modalPresentationSytle
        self.rootController.present(viewController, animated: animated)
    }
    
    func dismiss(animated: Bool = true) {
        self.rootController.dismiss(animated: animated)
    }
    
    func push(_ viewController: UIViewController, animated: Bool = true) {
        self.rootController.pushViewController(viewController, animated: animated)
    }
    
    func pop(animated: Bool = true) {
        self.rootController.popViewController(animated: animated)
    }
    
    func setRoot(_ viewControllers: [UIViewController], hideBar: Bool, animated: Bool = true) {
        self.rootController.isNavigationBarHidden = hideBar
        self.rootController.setViewControllers(viewControllers, animated: animated)
    }
    
    func setRoot(_ viewController: UIViewController, hideBar: Bool, animated: Bool = true) {
        self.rootController.isNavigationBarHidden = hideBar
        self.rootController.setViewControllers([viewController], animated: animated)
    }
}
