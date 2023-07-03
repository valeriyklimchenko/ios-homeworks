//
//  CustomCollectionGalery.swift
//  Navigation
//
//  Created by Валерий Климченко on 26.06.2023.
//

import UIKit

final class CustomCollectionGalery: UICollectionViewCell {
        
    private let imageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupGesture() {
        let imageViewTap = UITapGestureRecognizer(target: self, action: #selector(showImage))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(imageViewTap)
        imageView.superview?.bringSubviewToFront(imageView)
    }
    
    //CaAnimation
    @objc private func showImage() {
        print("123")
        let finalPosition = CGPoint(x: PhotoViewController().view.frame.width/2, y: 8)
        let finalSize = CGRect(x: 0, y: 0, width: PhotoViewController().view.bounds.width, height: PhotoViewController().view.bounds.width)
//        let finalCornerRadius = view.bounds.width / 2
//        let finalOpacity = 0.5
        
        let positionAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        positionAnimation.fromValue = imageView.center
        positionAnimation.toValue = finalPosition
        imageView.layer.position = finalPosition
        
        let sizeAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.bounds))
        sizeAnimation.fromValue = CGRect(x: 0, y: 0, width: imageView.bounds.width, height: imageView.bounds.height)
        sizeAnimation.toValue = finalSize
        imageView.layer.bounds = finalSize
        
//        let cornerRadiusAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.cornerRadius))
//        cornerRadiusAnimation.fromValue = avatar.layer.cornerRadius
//        cornerRadiusAnimation.toValue = finalCornerRadius
//        avatar.layer.cornerRadius = finalCornerRadius
//
//        let opacityAnimatuon = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
//        opacityAnimatuon.fromValue = 0
//        opacityAnimatuon.toValue = finalOpacity
//        newView.layer.opacity = 0.5
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.duration = 0.5
        groupAnimation.animations = [positionAnimation, sizeAnimation]
        groupAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        imageView.layer.add(groupAnimation, forKey: nil)
        
//        newView.layer.add(opacityAnimatuon, forKey: nil)
    }

private func layout() {
    contentView.addSubview(imageView)
    NSLayoutConstraint.activate([
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
}
    
    func setupCell(photosModel: PhotosModel) {
        imageView.image = UIImage(named: photosModel.photo)
    }
    
}
