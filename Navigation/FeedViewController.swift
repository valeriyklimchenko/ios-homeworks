//
//  FeedViewController.swift
//  Navigation
//
//  Created by Валерий Климченко on 12.04.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    //MARK: subviews
    //Создаем кнопку перехода в PostviewController
    private lazy var postButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Post", for: .normal)
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.borderWidth = 3
        button.backgroundColor = .systemGray3
        button.setTitleColor(.systemIndigo, for: .normal)
        button.layer.cornerRadius = 20
        button.layer.shadowOffset = CGSize(width: 10, height: 10)
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 30
        button.layer.shadowColor = UIColor.systemIndigo.cgColor
        button.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        return button
    }()
    
    private lazy var postButton2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Post", for: .normal)
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.borderWidth = 3
        button.backgroundColor = .systemGray5
        button.setTitleColor(.systemIndigo, for: .normal)
        button.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = view.backgroundColor
        stack.spacing = 10
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()
    
    //    Создаем объект типа Post в FeedViewController
    let postTitle: Post = Post(title: "PostTitle2")
    
    //MARK: life cycle
    //Переопределяем родительский метод viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemCyan
        title = "Feed"
        layout()
    }
    
    //MARK: private
    private func layout() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(postButton)
        stackView.addArrangedSubview(postButton)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 200),
            stackView.widthAnchor.constraint(equalToConstant: 200)
        ])
        stackView.addArrangedSubview(postButton)

    }
    
    //MARK: actions
    //Описываем действие по  кнопке
    @objc func showPost() {
        //При обработке нажатия создается экземпляр класса ProfileViewController()
        let PostviewController = PostviewController()
        //Для немодального перехода используется метод present
        navigationController?.pushViewController(PostviewController, animated: true)
        
    }
}
