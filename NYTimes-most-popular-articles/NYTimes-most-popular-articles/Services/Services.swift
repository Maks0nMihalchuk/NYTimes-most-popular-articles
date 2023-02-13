//
//  Services.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 08.02.2023.
//

import Foundation
import Alamofire

final class Services {
    
    // MARK: - Private
    private lazy var networker = Networker()
    private lazy var coreDataService = CoreDataService()
    
    // MARK: - Public
    lazy var articleProvider: ArticleProviderProtocol = ArticleProvider(
        network: networker
    )
    
    lazy var mapper: MapArticleServiceProtocol = MapArticleService()
    lazy var fileService: FileServiceProtocol = FileService()
    lazy var articleDataService: ArticleDataService = ArticleDataService(coreDataService: coreDataService)
}
