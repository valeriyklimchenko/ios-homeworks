//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Валерий Климченко on 09.06.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    //MARK: - private
    
    private let headerView = ProfileTableHeaderView()
    var initialRect: CGRect = .zero
    
    var postModel = PostModel.makePostModel()
    
    let avatar: UIImageView = {
        var view = UIImageView()
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 3
        view.layer.cornerRadius = 75
        view.clipsToBounds = true
        view.layer.opacity = 0
        return view
    }()

    let closeButton: UIButton = {
        var view = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 66, y: 100, width: 50, height: 50))
        view.setImage(UIImage(systemName: "xmark"), for: .normal)
        view.layer.opacity = 0
        view.backgroundColor = .systemGray4
        return view
    }()
    
    private let newView: UIView = {
       let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
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
        
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        layout()
        setupGesture()
    }
    
    //MARK: - Gesture
    private func setupGesture() {

        let closeGesture = UITapGestureRecognizer(target: self, action: #selector(closeAvatarAction))
        closeButton.addGestureRecognizer(closeGesture)
    }

    //MARK: - actions
    
    @objc private func closeAvatarAction() {
        closeAvatarAnimation(rect: initialRect)
    }
    
//    @objc private func oneMoreLike() {
//        postModel[0].likes += 1
////        self.postModel[indexPath.row].likes += 1
////        print(postModel[indexPath.row].likes)
//        tableView.reloadData()
//
//
//    }
    
    @objc private func openImageAnimate(image: UIImage?, imageFrame: CGRect) {
        avatar.image = image
        self.avatar.layer.opacity = 1
        self.avatar.layer.borderWidth = 0
        avatar.frame = CGRect(x: imageFrame.origin.x,
                              y: imageFrame.origin.y,
                              width: imageFrame.width,
                              height: imageFrame.height)
        UIView.animate(withDuration: 0.5) {
            self.newView.layer.opacity = 0.5
            self.avatar.layer.cornerRadius = 0
            self.avatar.frame.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            self.avatar.center = self.view.center
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.closeButton.layer.opacity = 1
            }
        }

    }
    
    //MARK: private func
        private func closeAvatarAnimation(rect: CGRect) {
            UIView.animate(withDuration: 0.3) {
                self.closeButton.layer.opacity = 0
            } completion: { _ in
                UIView.animate(withDuration: 0.5) {
                    self.newView.layer.opacity = 0
                    self.avatar.frame = rect
                    self.avatar.layer.cornerRadius = 75
                } completion: { _ in
                    self.avatar.layer.opacity = 0

                }
            }
        }

    //MARK: - Layout
    private func layout() {
        [tableView].forEach { view.addSubview($0) }
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
        [newView, closeButton, avatar].forEach { view.addSubview($0) }

    }

}

//MARK: - UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        //подписываюсь под делегат  хедера
        headerView.delegate = self
        
        if section == 0 {
            return headerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 250
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let photoVC = PhotoViewController()
            navigationController?.pushViewController(photoVC, animated: false)
        } else {
            let detailVC = DetailViewController()
            detailVC.setupDetailVC(model: postModel[indexPath.row], indexPath: indexPath)
            present(detailVC, animated: true)
        }
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 150
        }
        return UITableView.automaticDimension
    }
    
}

//MARK: - UITableViewDataSource
extension ProfileViewController: UITableViewDataSource{
    
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
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.setupCell(model: postModel[indexPath.row])
            return cell
        }
    }
}

extension ProfileViewController: ProfileTableHeaderViewDelegate {
    func protocolFunction(image: UIImage?, imageRect: CGRect) {
        //Узнаем где находится хэдер таблицы
        let rect = headerView.frame
        //конвертируем в положение хэдера относительно superview
        let currentHeaderRect = tableView.convert(rect, to: view)
        initialRect = CGRect(x: imageRect.origin.x,
                             y: imageRect.origin.y + currentHeaderRect.origin.y, //отступ сверху + высота бара
                             width: imageRect.width,
                             height: imageRect.height)
        
        //в функцию анимации передаю картинку и ее координаты
        openImageAnimate(image: image, imageFrame: initialRect)
    }
}
