//
//  API.swift
//  ImageCollection
//
//  Created by Денис on 04.02.2021.
//

import Foundation

enum API {
//    static let baseURL = "https://picsum.photos/v2/list?limit=100"
    static let baseURL = "https://api.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=da9d38d3dee82ec8dda8bb0763bf5d9c&format=json&nojsoncallback=1"
}

struct ImageURLBuilder {
    static func getURL(from photo: Photo) -> String? {
        "https://farm\(photo.farm).staticflickr.com/\(photo.server)/\(photo.id)_\(photo.secret).jpg"
    }
}

