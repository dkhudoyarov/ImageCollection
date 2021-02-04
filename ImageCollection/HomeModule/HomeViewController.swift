//
//  HomeViewController.swift
//  ImageCollection
//
//  Created by Денис on 04.02.2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    var viewModel: HomeViewModelProtocol! {
        didSet {
            viewModel.getResponse { [weak self] in
                guard let self = self else { return }
                self.collectionView.reloadData()
            }
        }
    }
    
    private lazy var collectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        let size = UIScreen.main.bounds.width - 40
        layout.itemSize = CGSize(width: size, height: size)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.minimumLineSpacing = 16
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.dataSource = self
        collection.delegate = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        HomeCollectionViewCell.register(collectionView)
        view.backgroundColor = .white
        setupConstraits()
    }
    
    // MARK: - Methods
    private func setupConstraits() {
        view.addSubview(collectionView)
        collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
}

// MARK: - UICollectionViewDelegate & UICollectionViewDataSource
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRows() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = HomeCollectionViewCell.dequeue(collectionView, for: indexPath)
        let photo = viewModel?.response?.photos.photo[indexPath.row]
        cell.configure(with: photo)
        return cell
    }
}
