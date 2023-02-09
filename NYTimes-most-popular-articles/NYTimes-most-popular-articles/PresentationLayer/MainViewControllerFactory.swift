//
//  MainViewControllerFactory.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import UIKit

protocol MainViewControllerFactory {
    
    func buildTabBarController() -> UITabBarController
    func buildMostEmailedVC(service: Services) -> MPArticlesViewController
    func buildMostSharedVC(service: Services) -> MPArticlesViewController
    func buildMostViewedVC(service: Services) -> MPArticlesViewController
    func buildFavoritesArticlesVC(service: Services) -> FavoritesArticlesViewController
}
