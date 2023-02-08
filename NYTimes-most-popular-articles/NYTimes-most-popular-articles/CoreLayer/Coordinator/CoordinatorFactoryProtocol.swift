//
//  CoordinatorFactoryProtocol.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import Foundation

protocol CoordinatorFactoryProtocol {
    
    func buildAppCoordinator(services: Services) -> AppCoordinator
    func buildMainCoordinator(services: Services) -> MainCoordinator
}
