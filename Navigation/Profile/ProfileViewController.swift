//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Валерий Климченко on 09.06.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    //MARK: private
    
    private let headerView = ProfileTableHeaderView()
    var initialRect: CGRect = .zero
    
    var postModel = PostModel.makePostModel()
    
    let avatar: UIImageView = {
        var view = UIImageView(image: UIImage(named: "11"))
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 3
        view.layer.cornerRadius = 75
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 1
//        view.layer.opacity = 0
        return view
    }()

    let cross: UIImageView = {
        var view = UIImageView(image: UIImage(systemName: "xmark"))
        view.layer.opacity = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let newView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.opacity = 0
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemGray6
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self

        return tableView
    }()
        
    //MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        layout()
        setupGesture()
    }
    
    
    func setupGesture() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAnimate))
        avatar.addGestureRecognizer(tapGesture)
        
//        let moreLikes = UITapGestureRecognizer(target: self, action: #selector(oneMoreLike))
//        tableView.isUserInteractionEnabled = true
//        tableView.addGestureRecognizer(moreLikes)
//        viewsLabel.addGestureRecognizer(moreLikes)
    }

    
    @objc private func oneMoreLike() {
        postModel[0].likes += 1
//        self.postModel[indexPath.row].likes += 1
//        print(postModel[indexPath.row].likes)
        tableView.reloadData()
        

    }
    

//    //KeyframesAnimation
//    @objc private func animateKeyframesTap() {
//        UIView.animateKeyframes(withDuration: 0.8, delay: 0) {
//            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5/0.8) {
//                self.newView.layer.opacity = 0.5
//
//                let avatarWidth = self.view.frame.size.width - 16
//                self.leadingAvatar.constant = 8
//                self.topAvatar.constant = 200
//                self.widthAvatar.constant = avatarWidth
//                self.heightAvatar.constant = avatarWidth
//                self.avatar.layer.cornerRadius = 0
//                self.avatar.layer.opacity = 1
//
//                self.avatar.layoutIfNeeded()
//            }
//            UIView.addKeyframe(withRelativeStartTime: 0.5/0.8, relativeDuration: 1) {
//                self.cross.layer.opacity = 1
//            }
//        }
//    }
//
//    @objc private func crossKeyframesTap() {
//        UIView.animateKeyframes(withDuration: 0.8, delay: 0) {
//            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3/0.8) {
//                self.cross.layer.opacity = 0
//            }
//            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 1) {
//                self.newView.layer.opacity = 0
//                let avatarWidth: CGFloat = 150
//                self.leadingAvatar.constant = 16
//                self.topAvatar.constant = 16
//                self.widthAvatar.constant = avatarWidth
//                self.heightAvatar.constant = avatarWidth
//                self.avatar.layer.cornerRadius = 75
//
//                self.avatar.layoutIfNeeded()
//
//            }
//        }
//    }


    
    @objc private func tapAnimate(image: UIImage, imageFrame: CGRect) {
        [newView, cross, avatar].forEach { view.addSubview($0) }
        avatar.frame = CGRect(x: imageFrame.origin.x, y: imageFrame.origin.y, width: imageFrame.width, height: imageFrame.height)
        UIView.animate(withDuration: 0.8) {
            self.avatar.frame.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            self.avatar.center = self.view.center
            self.avatar.layer.cornerRadius = UIScreen.main.bounds.width / 2
        }

    }

    private func layout() {
        [tableView].forEach { view.addSubview($0) }
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
    }

}

//MARK: extentios
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        //Подписываюсь на делегата headerView, затем реализую функцию в extention
        headerView.delegate = self
        
        if section == 0 {
//            return view.bounds.height
            return 250
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let vc = PhotoViewController()
            navigationController?.pushViewController(vc, animated: false)
        }
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 150
        }
        return UITableView.automaticDimension
    }
    
}


extension ProfileViewController: UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return headerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return postModel.count
        }
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
//            cell.accessoryType = .disclosureIndicator
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.setupCell(model: postModel[indexPath.row])
            return cell
        }
    }
}

extension ProfileViewController: ProfileTableHeaderViewDelegate {
    func tapAction(image: UIImage?, imageRect: CGRect) {
        //Узнаем где находится аватар
        let rect = headerView.frame
        //конвертируем в положение относительно view
        let currentHeaderRect = tableView.convert(rect, to: view)
        initialRect = CGRect(x: imageRect.origin.x,
                             y: imageRect.origin.y + currentHeaderRect.origin.y, //отступ сверху + высота бара
                             width: imageRect.width,
                             height: imageRect.height)
        
        //в функцию анимации передаю картинку и ее координаты
        tapAnimate(image: image!, imageFrame: initialRect)
    }
    
    
}
