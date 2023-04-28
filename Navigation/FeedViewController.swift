//
//  FeedViewController.swift
//  Navigation
//
//  Created by Валерий Климченко on 12.04.2023.
//

import UIKit

class FeedViewController: UIViewController {

    private lazy var postButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Post", for: .normal)
        button.setTitleColor(.systemIndigo, for: .normal)
        button.setTitleShadowColor(.systemRed, for: .normal)
        button.clipsToBounds = true
        return button
        
    }()
    
//    Создаем объект типа пост в FeedViewController
    let postTitle: Post = Post(title: "PostTitle2")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemCyan
        title = "Feed"
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.addSubview(postButton)
        
        NSLayoutConstraint.activate([
            postButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            postButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            postButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 20),
            postButton.heightAnchor.constraint(equalToConstant: 100)
        ])
        
//        NSLayoutConstraint(item: postButton, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 100).isActive = true
        
        
//        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
//                NSLayoutConstraint.activate([
//                    postButton.leadingAnchor.constraint(equalTo: view.leadingAnchor)
//                    postButton.leadingAnchor.constraint(
//                        equalTo: view.leadingAnchor
//                    ),
//                    postButton.trailingAnchor.constraint(
//                        equalTo: view.trailingAnchor,
//                        constant: -20.0
//                    ),
//                    postButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//                    postButton.heightAnchor.constraint(equalToConstant: 44.0)
//                ])
        
//        let horizontalConstraintP = postButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        let verticalConstraintP = postButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        let widthConstraintP = postButton.widthAnchor.constraint(equalToConstant: 100)
//        let heightConstraintP = postButton.heightAnchor.constraint(equalToConstant: 100)
//        view.addConstraints([horizontalConstraintP, verticalConstraintP])
        
//        let newView = UIView()
//        newView.backgroundColor = UIColor.red
//        view.addSubview(newView)
//        
//        newView.translatesAutoresizingMaskIntoConstraints = false
//        let horizontalConstraint = newView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        let verticalConstraint = newView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        let widthConstraint = newView.widthAnchor.constraint(equalToConstant: 100)
//        let heightConstraint = newView.heightAnchor.constraint(equalToConstant: 100)
//        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
    
        postButton.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        
    }
    
    @objc func showPost() {
        
        let PostviewController = PostviewController()
        
        navigationController?.pushViewController(PostviewController, animated: true)
        
    }
}
