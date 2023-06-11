//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Валерий Климченко on 09.06.2023.
//

import UIKit

final class ProfileViewController: UIViewController {

    //MARK: private
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .cyan

        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self

        return tableView
    }()
    
    private let postModel = PostModel.makePostModel()

    //MARK: life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    

    private func layout() {
        view.addSubview(tableView)
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])

    }

}

//MARK: extentios
extension ProfileViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        250
    }
    
}

extension ProfileViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        ProfileTableHeaderView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.setupCell(model: postModel[indexPath.row])

        return cell
    }
    
    
}
