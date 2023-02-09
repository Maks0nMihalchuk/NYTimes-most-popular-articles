//
//  MappingModelService.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 09.02.2023.
//

import Foundation

protocol MapArticleModelServiceProtocol {
    func mapArticleResponceModelToArticleModel(responseModel: ArticleResponse) -> [ArticleModel] 
}

class MapArticleModelService {
    
    // MARK: - Private method
    
    private func mapMediaResponseTo(data: [MediaResponse]) -> ArticleMediaModel {
        return data.map { [unowned self] media in
            let metadata = self.mapMediaMetaDataResponceTo(data: media.mediaMetadata)
            return ArticleMediaModel(copyright: media.copyright, mediaMetadata: metadata)
        }.first ?? ArticleMediaModel(copyright: "", mediaMetadata: [])
    }
    
    private func mapMediaMetaDataResponceTo(data: [MediaMetadataResponse]) -> [ArticleMediaMetadataModel] {
        return data.map { ArticleMediaMetadataModel(url: $0.url) }
    }
}

// MARK: - MapArticleModelServiceProtocol
extension MapArticleModelService: MapArticleModelServiceProtocol {
    
    func mapArticleResponceModelToArticleModel(responseModel: ArticleResponse) -> [ArticleModel] {
        let articleResponseResult = responseModel.results

        return articleResponseResult.map { article in
            let articleMedia = mapMediaResponseTo(data: article.media)
            return ArticleModel(isFavorite: false,
                                url: article.url,
                                id: article.id,
                                source: article.source,
                                publishedDate: article.publishedDate,
                                updated: article.updated,
                                section: article.section,
                                subSection: article.subSection,
                                byline: article.byline,
                                type: article.type,
                                title: article.title,
                                abstract: article.abstract,
                                media: articleMedia)
            
        }
    }
}
