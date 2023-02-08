//
//  MainViewControllerFactory.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import UIKit

protocol MainViewControllerFactory {
    
    func buildTabBarController() -> UITabBarController
    func buildMostEmailedVC(service: Services) -> MostEmailedViewController
    func buildMostSharedVC(service: Services) -> MostSharedViewController
    func buildMostViewedVC(service: Services) -> MostViewedViewController
    func buildFavoritesArticlesVC(service: Services) -> FavoritesArticlesViewController
}
