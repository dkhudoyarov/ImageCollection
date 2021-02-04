//
//  Response.swift
//  ImageCollection
//
//  Created by Денис on 04.02.2021.
//

import Foundation

struct Response: Codable {
    let photos: Photos
}

struct Photos: Codable {
    let photo: [Photo]
}

struct Photo: Codable {
    let id, owner, secret, server: String
    let farm: Int
}

