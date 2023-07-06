//
//  CustomTableViewCell.swift
//  Navigation
//
//  Created by Валерий Климченко on 09.06.2023.
//

import UIKit
protocol PostTableViewCellDelegate: AnyObject {
    func increseNumbersOfLikesDelegate(indexPath: IndexPath)
}

final class PostTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    weak var delegateLikes: PostTableViewCellDelegate?
    
    private var numberOfLikes: Int = 0
    private var initialIndexPath = IndexPath()

    
    private var isViewed: Bool = false
//    private var isLiked: Bool = false
    
    private let whiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    private let postImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .lightGray
        label.numberOfLines = 0
        return label
    }()
    
    let likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 2
        return label
    }()
    
    let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 2
        return label
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        setupGestures()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - Gestures
    private func setupGestures() {
        let oneMoreLikes = UITapGestureRecognizer(target: self, action: #selector(oneMoreLike))
        likesLabel.isUserInteractionEnabled = true
        likesLabel.addGestureRecognizer(oneMoreLikes)
        }
    
//MARK: - Actions
    @objc private func oneMoreLike() {
        delegateLikes?.increseNumbersOfLikesDelegate(indexPath: initialIndexPath)
        
    }
    
//MARK: - Funcs
    override func prepareForReuse() {
        super.prepareForReuse()
        headerLabel.text = nil
        postImage.image = nil
        descriptionLabel.text = nil
        likesLabel.text = nil
        viewsLabel.text = nil
    }
    
    func setupCell(model: PostModel) {
        headerLabel.text = model.author
        postImage.image = UIImage(named: model.image)
        descriptionLabel.text = model.description
        likesLabel.text = String("Likes: \(model.likes)")
        viewsLabel.text = String("Views \(model.views)")
        if isViewed == true {
            viewsLabel.textColor = .red
        }
    }
    
    func setupPostTableViewIndexPath(indexPath: IndexPath) {
        initialIndexPath = indexPath
    }
    
    private func layout() {
        let inset: CGFloat = 16
        let width: CGFloat = 100
        [whiteView, headerLabel, postImage, descriptionLabel, likesLabel, viewsLabel].forEach { contentView.addSubview($0) }
        NSLayoutConstraint.activate([
            whiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            whiteView.topAnchor.constraint(equalTo: contentView.topAnchor),
            whiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            headerLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
            headerLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: inset),
            headerLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -inset),
            
            postImage.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 0),
            postImage.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: inset),
            postImage.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: 0),
            postImage.heightAnchor.constraint(equalToConstant: 300),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
            descriptionLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: inset),
            descriptionLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -inset),
            
            likesLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: inset),
            likesLabel.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -inset),
            likesLabel.widthAnchor.constraint(equalToConstant: width),
            
            viewsLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -inset),
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: inset),
            viewsLabel.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -inset),
            viewsLabel.widthAnchor.constraint(equalToConstant: width)
        ])
    }
    
}
