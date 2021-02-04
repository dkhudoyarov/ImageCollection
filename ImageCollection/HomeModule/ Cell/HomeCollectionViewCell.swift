//
//  HomeCollectionViewCell.swift
//  ImageCollection
//
//  Created by Денис on 04.02.2021.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let cellId = "HomeCollectionViewCell"
        
    private var imageView: WebImageView = {
        let image = WebImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupConstraits()
        
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 2, height: 3)
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.3
        self.layer.masksToBounds = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func configure(with photo: Photo?) {
        guard let photo = photo else { return }
        let url = ImageURLBuilder.getURL(from: photo)
        imageView.set(imageURL: url)
    }
    
    private func setupConstraits() {
        addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    static func register(_ colelctionView: UICollectionView) {
        colelctionView.register(self, forCellWithReuseIdentifier: cellId)
    }
    
    static func dequeue(_ colelctionView: UICollectionView, for indexPath: IndexPath) -> HomeCollectionViewCell {
        guard let cell = colelctionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? HomeCollectionViewCell else { return HomeCollectionViewCell() }
        return cell
    }
}
