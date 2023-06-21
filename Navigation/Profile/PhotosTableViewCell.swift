//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Валерий Климченко on 17.06.2023.
//

import UIKit

final class PhotosTableViewCell: UITableViewCell {
     
    private lazy var photoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    private var photoModel = PhotosModel.makePhotosModel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        customiseCollection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customiseCollection() {
        photoCollectionView.backgroundColor = .systemGray5
    }
    
    private func layout() {
        let safeArea = contentView.safeAreaLayoutGuide
          contentView.addSubview(photoCollectionView)
        NSLayoutConstraint.activate([
            photoCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            photoCollectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            photoCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            photoCollectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
//            photoCollectionView.heightAnchor.constraint(equalToConstant: 500)
        ])
        
    }
    
}

extension PhotosTableViewCell: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        cell.setupCell(photosModel: PhotosModel(photo: String(indexPath.row + 1)))
        return cell
    }
    
    
}

extension UITableViewCell: UICollectionViewDelegateFlowLayout {
    
    private var inset: CGFloat { return 10 }
    
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 5 * inset) / 4
        return CGSize(width: width, height: 9999)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        inset * 10
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
}
