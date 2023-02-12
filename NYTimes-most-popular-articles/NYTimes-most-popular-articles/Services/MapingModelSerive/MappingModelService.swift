//
//  MappingModelService.swift
//  NYTimes-most-popular-articles
//
//  Created by Максим Михальчук on 09.02.2023.
//

import Foundation

protocol MapArticleServiceProtocol {
    func mapArticleResponceModelToArticleModel(responseModel: ArticleResponse) -> [ArticleModel] 
}

class MapArticleService {
    
    // MARK: - Private method
    
    private func mapMediaResponseTo(data: [MediaResponse]) -> ArticleMediaModel {
        return data.map { [unowned self] media in
            
            let metadataURL = self.mapMediaMetaDataResponceTo(data: media.mediaMetadata)
            return ArticleMediaModel(copyright: media.copyright,
                                     url: metadataURL,
                                     imagePath: "",
                                     mediaData: nil)
        }.first ?? ArticleMediaModel(copyright: "",
                                     url: "",
                                     imagePath: "",
                                     mediaData: nil)
    }
    
    private func mapMediaMetaDataResponceTo(data: [MediaMetadataResponse]) -> String {
        return data.compactMap { $0.url }.last ?? ""
    }
    
    private func convertDateToAnotherFormat(date: String, fromFormate: DateFormats,
                                            toFormate: DateFormats) -> String {
        return date.convertDateString(
            fromDateFormat: fromFormate.value,
            toDateFormat: toFormate.value
        ) ?? ""
    }
}

// MARK: - MapArticleModelServiceProtocol
extension MapArticleService: MapArticleServiceProtocol {
    
    func mapArticleResponceModelToArticleModel(responseModel: ArticleResponse) -> [ArticleModel] {
        let articleResponseResult = responseModel.results

        return articleResponseResult.map { [unowned self] article in
            let articleMedia = mapMediaResponseTo(data: article.media)
            let publishedDate = convertDateToAnotherFormat(
                date: article.publishedDate,
                fromFormate: .publishedBackendData,
                toFormate: .publishedData)
            let updateDate = convertDateToAnotherFormat(
                date: article.updated,
                fromFormate: .updateBackendData,
                toFormate: .updateData)
            return ArticleModel(isFavorite: false,
                                articleID: article.id,
                                url: article.url,
                                title: article.title,
                                byline: article.byline,
                                abstract: article.abstract,
                                published: publishedDate,
                                update: updateDate,
                                section: article.section,
                                subSection: article.subSection,
                                type: article.type,
                                source: article.source,
                                media: articleMedia)
        }
    }
}
