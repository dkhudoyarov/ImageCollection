//
//  HomeViewModel.swift
//  ImageCollection
//
//  Created by Денис on 04.02.2021.
//

import Foundation

protocol HomeViewModelProtocol {
    init(networkingManager: Networking)
    var response: Response? { get }
    func getResponse(completion: @escaping () -> ())
    func numberOfRows() -> Int?
}

final class HomeViewModel: HomeViewModelProtocol {
    
    var response: Response?
    var networkingManager: Networking?
    
    init(networkingManager: Networking) {
        self.networkingManager = networkingManager
    }
    
    func getResponse(completion: @escaping () -> ()) {
        networkingManager?.fetchData(from: API.baseURL) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.response = response
                DispatchQueue.main.async {
                    completion()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func numberOfRows() -> Int? {
        response?.photos.photo.count
    }
}
