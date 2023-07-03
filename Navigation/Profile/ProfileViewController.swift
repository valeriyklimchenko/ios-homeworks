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
    private let ava = ProfileTableHeaderView().avatarImageView
    
    var postModel = PostModel.makePostModel()
    
    private var leadingAvatar = NSLayoutConstraint()
    private var topAvatar = NSLayoutConstraint()
    private var heightAvatar = NSLayoutConstraint()
    private var widthAvatar = NSLayoutConstraint()

    
    let avatar: UIImageView = {
        var view = UIImageView(image: UIImage(named: "11"))
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 3
        view.layer.cornerRadius = 75
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.opacity = 0
        return view
    }()

    let cross: UIImageView = {
        var view = UIImageView(image: UIImage(systemName: "cross.fill"))
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
        let avatarImageViewTap = UITapGestureRecognizer(target: self, action: #selector(animateKeyframesTap))
        ava.isUserInteractionEnabled = true
        ava.addGestureRecognizer(avatarImageViewTap)
        
        let crossViewTap = UITapGestureRecognizer(target: self, action: #selector(crossKeyframesTap))
        cross.isUserInteractionEnabled = true
        cross.addGestureRecognizer(crossViewTap)
        
        let moreLikes = UITapGestureRecognizer(target: self, action: #selector(oneMoreLike))
        tableView.isUserInteractionEnabled = true
        tableView.addGestureRecognizer(moreLikes)
//        viewsLabel.addGestureRecognizer(moreLikes)
        
//        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didSelectItem(sender:)))
//
    }
   
//    @objc func didSelectItem(sender: AnyObject?) {
//        print("didSelectItem: \(sender)")
//    }
    
    @objc private func oneMoreLike() {
        postModel[0].likes += 1
//        self.postModel[indexPath.row].likes += 1
//        print(postModel[indexPath.row].likes)
        tableView.reloadData()
        

    }
    

    //KeyframesAnimation
    @objc private func animateKeyframesTap() {
        UIView.animateKeyframes(withDuration: 0.8, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5/0.8) {
                print("123")
                self.newView.layer.opacity = 0.5
                
                let avatarWidth = self.view.frame.size.width - 16
                self.leadingAvatar.constant = 8
                self.topAvatar.constant = 200
                self.widthAvatar.constant = avatarWidth
                self.heightAvatar.constant = avatarWidth
                self.avatar.layer.cornerRadius = 0
                self.avatar.layer.opacity = 1

                self.avatar.layoutIfNeeded()
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5/0.8, relativeDuration: 1) {
                self.cross.layer.opacity = 1
            }
        }
    }
    
    @objc private func crossKeyframesTap() {
        UIView.animateKeyframes(withDuration: 0.8, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3/0.8) {
                self.cross.layer.opacity = 0
            }
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 1) {
                self.newView.layer.opacity = 0
                let avatarWidth: CGFloat = 150
                self.leadingAvatar.constant = 16
                self.topAvatar.constant = 16
                self.widthAvatar.constant = avatarWidth
                self.heightAvatar.constant = avatarWidth
                self.avatar.layer.cornerRadius = 75
                
                self.avatar.layoutIfNeeded()
                
            }
        }
    }

    //CaAnimation
//    @objc private func CAAnimationTap() {
//        let finalPosition = CGPoint(x: ProfileViewController().view.center.x, y: ProfileViewController().view.center.y)
//        let finalSize = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.width)
//        let finalCornerRadius = view.bounds.width / 2
//        let finalOpacity = 0.5
//
//        let positionAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
//        positionAnimation.fromValue = avatar.center
//        positionAnimation.toValue = finalPosition
//        avatar.layer.position = finalPosition
//
//        let sizeAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.bounds))
//        sizeAnimation.fromValue = CGRect(x: 0, y: 0, width: avatar.bounds.width, height: avatar.bounds.height)
//        sizeAnimation.toValue = finalSize
//        avatar.layer.bounds = finalSize
//
//        let cornerRadiusAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.cornerRadius))
//        cornerRadiusAnimation.fromValue = avatar.layer.cornerRadius
//        cornerRadiusAnimation.toValue = finalCornerRadius
//        avatar.layer.cornerRadius = finalCornerRadius
//
//        let opacityAnimatuon = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
//        opacityAnimatuon.fromValue = 0
//        opacityAnimatuon.toValue = finalOpacity
//        newView.layer.opacity = 0.5
//
//        let groupAnimation = CAAnimationGroup()
//        groupAnimation.duration = 0.5
//        groupAnimation.animations = [positionAnimation, sizeAnimation, cornerRadiusAnimation]
//        groupAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
//        avatar.layer.add(groupAnimation, forKey: nil)
//
//        newView.layer.add(opacityAnimatuon, forKey: nil)
//    }

    private func layout() {
        [tableView, newView, avatar, cross].forEach { view.addSubview($0) }
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
            newView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            newView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            newView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            newView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
            cross.trailingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: -32),
            cross.topAnchor.constraint(equalTo: avatar.topAnchor, constant: 32),
            cross.widthAnchor.constraint(equalToConstant: 60),
            cross.heightAnchor.constraint(equalToConstant: 60)
            
        ])
        leadingAvatar = avatar.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16)
        topAvatar = avatar.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16)
        widthAvatar = avatar.widthAnchor.constraint(equalToConstant: 150)
        heightAvatar = avatar.heightAnchor.constraint(equalToConstant: 150)
        NSLayoutConstraint.activate([leadingAvatar, topAvatar, widthAvatar, heightAvatar])
    }

}

//MARK: extentios
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
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

