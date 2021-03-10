//
//  NewsDetailViewModel.swift
//  NewsDetailsUI
//
//  Created by Vinodh Govindaswamy on 27/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import Foundation
import NewsService
import VSCollectionKit

protocol NewsDetailsViewAPI {
    var collectionViewData: VSCollectionViewData? { get }
}

class NewsDetailsViewModel: NewsDetailsViewAPI {

    let item: HomeScreenResponse.Campaign
    var collectionViewData: VSCollectionViewData?

    init(newsItem: HomeScreenResponse.Campaign) {
        self.item = newsItem
        collectionViewData = collectionViewData(for: newsItem)
    }

    private func collectionViewData(for newsItem: HomeScreenResponse.Campaign) -> VSCollectionViewData {
        var collectionData = VSCollectionViewData()
        collectionData.add(section: NewsImageSectionModel(item: newsItem))
        collectionData.add(section: NewsDetailsSectionModel(details: newsItem.title))
        return collectionData
    }
}
