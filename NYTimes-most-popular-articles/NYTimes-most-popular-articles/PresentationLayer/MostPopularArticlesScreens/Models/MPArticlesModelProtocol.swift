//
//  MPArticlesModelProtocol.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 09.02.2023.
//

import Foundation

protocol MPArticlesModelProtocol {
    
    func getArticles(completion: @escaping (Result<[ArticleModel] ,NetworkError>) -> Void)
}

