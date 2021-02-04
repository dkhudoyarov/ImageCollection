//
//  Builder.swift
//  ImageCollection
//
//  Created by Денис on 04.02.2021.
//

import UIKit

protocol BuilderProtocol {
    func createHomeModule() -> UIViewController
}

final class Builder: BuilderProtocol {
    func createHomeModule() -> UIViewController {
        let view = HomeViewController()
        let networkingManager: Networking = NetworkingManager()
        let viewModel = HomeViewModel(networkingManager: networkingManager)
        view.viewModel = viewModel
        return view
    }
}
