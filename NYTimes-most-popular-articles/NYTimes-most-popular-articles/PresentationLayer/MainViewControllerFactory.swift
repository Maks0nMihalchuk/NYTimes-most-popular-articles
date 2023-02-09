//
//  MainViewControllerFactory.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import UIKit

protocol MainViewControllerFactory {
    
    func buildTabBarController() -> UITabBarController
    func buildMostEmailedVC(service: Services,
                            routes: MPArticlesPresenterRoutes) -> MPArticlesViewController
    func buildMostSharedVC(service: Services,
                           routes: MPArticlesPresenterRoutes) -> MPArticlesViewController
    func buildMostViewedVC(service: Services,
                           routes: MPArticlesPresenterRoutes) -> MPArticlesViewController
    func buildFavoritesArticlesVC(service: Services) -> FavoritesArticlesViewController
    
    func buildArticleDetailsVC(services: Services) -> ArticleDetailsViewController
}
