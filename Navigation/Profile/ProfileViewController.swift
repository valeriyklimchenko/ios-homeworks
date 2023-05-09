//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Валерий Климченко on 06.05.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: subviews
        let profileHeaderView = ProfileHeaderView()
    
    //MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Profile"
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        view.addSubview(profileHeaderView)
        layout()
        
    }

    //MARK: private
    private func layout() {
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.topAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
