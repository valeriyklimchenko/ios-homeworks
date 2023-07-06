//
//  CustomCollectionGalery.swift
//  Navigation
//
//  Created by Валерий Климченко on 26.06.2023.
//

import UIKit

protocol CustomCollectionGaleryDelegate: AnyObject {
    func protocolFnction(image: UIImage?, imageRect: CGRect, indexPath: IndexPath)
}

final class CustomCollectionGalery: UICollectionViewCell {
        
//MARK: - Private
    
    weak var delegate: CustomCollectionGaleryDelegate?
    private var initialIndexPath = IndexPath()
    
    
    private let imageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        return image
    }()
    
//MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - Gesture
    private func setupGesture() {
        let imagaTaoGesture = UITapGestureRecognizer(target: self, action: #selector(openImage))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(imagaTaoGesture)
    }
    
//MARK: - Actions
    @objc private func openImage() {
        delegate?.protocolFnction(image: imageView.image, imageRect: imageView.frame, indexPath: initialIndexPath)
    }
    
    
//MARK: - Layout
private func layout() {
    contentView.addSubview(imageView)
    NSLayoutConstraint.activate([
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
}
    
//MARK: - Metods
    func setupCell(photosModel: PhotosModel) {
        imageView.image = UIImage(named: photosModel.photo)
    }
    
    func setGaleryIndexPath(indexPath: IndexPath) {
        initialIndexPath = indexPath
    }
}
