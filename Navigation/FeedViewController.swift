//
//  FeedViewController.swift
//  Navigation
//
//  Created by Валерий Климченко on 12.04.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    //Создаем кнопку перехода в PostviewController
    private lazy var postButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Post", for: .normal)
        button.setTitleColor(.systemIndigo, for: .normal)
        button.setTitleShadowColor(.systemRed, for: .normal)
        button.clipsToBounds = true
        return button
        
    }()
    
    //    Создаем объект типа Post в FeedViewController
    let postTitle: Post = Post(title: "PostTitle2")
    
    //Переопределяем родительский метод viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemCyan
        title = "Feed"
        
    }
    
    //Переопределяем родительский метод viewDidLayoutSubviews для добавления сабвью
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.addSubview(postButton)
        
        NSLayoutConstraint.activate([
            postButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            postButton.heightAnchor.constraint(equalToConstant: 50),
            postButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        postButton.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        
    }
    
    //Описываем действие по кнопке
    @objc func showPost() {
        //При обработке нажатия создается экземпляр класса ProfileViewController()
        let PostviewController = PostviewController()
        //Для немодального перехода используется метод present
        navigationController?.pushViewController(PostviewController, animated: true)
        
    }
}
