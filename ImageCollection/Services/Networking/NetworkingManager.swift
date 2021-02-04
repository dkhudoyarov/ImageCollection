//
//  NetworkingManager.swift
//  ImageCollection
//
//  Created by Денис on 04.02.2021.
//

import Foundation

protocol Networking {
    func fetchData(from url: String, completion: @escaping (Result<Response, Error>) -> Void)
}

final class NetworkingManager: Networking {
            
    private let networkDataFetcher: DataFetcherProtocol = NetworkDataFetcher()
        
    func fetchData(from url: String,completion: @escaping (Result<Response, Error>) -> Void) {
        networkDataFetcher.fetchGenericJSONData(fromUrl: url, completion: completion)
    }
}
