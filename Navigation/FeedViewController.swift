//
//  FeedViewController.swift
//  Navigation
//
//  Created by Валерий Климченко on 12.04.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    //MARK: subviews
    //Создаем 2 кнопки перехода в PostviewController, используя extention
    private lazy var postButton = makeButton()
    private lazy var postButton2 = makeButton()

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
    
    //MARK: func
    private func layout() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(postButton)
        stackView.addArrangedSubview(postButton2)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 200),
            stackView.widthAnchor.constraint(equalToConstant: 200)
        ])
        stackView.addArrangedSubview(postButton)

    }
}
