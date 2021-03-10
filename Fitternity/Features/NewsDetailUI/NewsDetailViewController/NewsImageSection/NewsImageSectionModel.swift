//
//  NewsImageSectionModel.swift
//  NewsDetailsUI
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import VSCollectionKit
import NewsService
import NewsShared

struct NewsImageSectionModel: SectionModel {

    var sectionType: String {
        return NewsDetailsSectionType.newsImage.rawValue
    }

    private let newsItem: HomeScreenResponse.Campaign
    let sectionID: String
    init (item: HomeScreenResponse.Campaign) {
        self.newsItem = item
        items = [NewsImageCellModel(item: item)]
        sectionID = UUID().uuidString
    }

    var header: HeaderViewModel?
    var items: [CellModel]
}

struct NewsImageCellModel: CellModel {

    let newsItem: HomeScreenResponse.Campaign
    let cellID: String
    init (item: HomeScreenResponse.Campaign) {
        self.newsItem = item
        cellID = UUID().uuidString
        (self.imageUrl, self.cachedImageUrl) = imageUrls(media: item)
    }

    var cellType: String {
        return NewsDetailsCellType.newsImage.rawValue
    }

    var title: String {
        return newsItem.title
    }

    var imageUrl: String?
    var cachedImageUrl: String?

    var timestamp: String {
        return  Date().elapsedTimeString() // newsItem.publishedDate.elapsedTimeString()
    }

    private func imageUrls(media: HomeScreenResponse.Campaign?) -> (String?, String?) {
        var imageUrl: String? = nil
        var cacheImageUrl: String? = nil

//        media?.forEach { (imageDetails) in
////            if imageDetails.size == NewsImageSize.large.rawValue {
////                imageUrl = imageDetails.url
////            }
////
////            if imageDetails.size == NewsImageSize.medium.rawValue {
////                cacheImageUrl = imageDetails.url
////            }
//        }

        return (imageUrl, cacheImageUrl)
    }
}
