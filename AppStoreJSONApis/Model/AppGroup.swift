//
//  AppGroup.swift
//  AppStoreJSONApis
//
//  Created by Victor Hugo on 6/02/20.
//  Copyright © 2020 Vintage Robot. All rights reserved.
//

import Foundation

struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let id, name, artistName, artworkUrl100: String
}
