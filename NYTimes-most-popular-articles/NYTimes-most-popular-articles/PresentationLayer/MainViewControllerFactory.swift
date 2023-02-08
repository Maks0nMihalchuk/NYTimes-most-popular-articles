//
//  MainViewControllerFactory.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import UIKit

protocol MainViewControllerFactory {
    
    func buildTabBarController() -> UITabBarController
}
