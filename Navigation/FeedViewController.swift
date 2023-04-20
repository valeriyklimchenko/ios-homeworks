//
//  FeedViewController.swift
//  Navigation
//
//  Created by Валерий Климченко on 12.04.2023.
//

import UIKit

class FeedViewController: UIViewController {

//    Создаем объект типа пост
    let postTitle: Post = Post(title: "PostTitle 2")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemCyan
        title = "Feed"
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let button = UIButton(type: .custom)
        
        button.frame = CGRect(x: 30, y: 120, width: 150, height: 30)
        button.backgroundColor = .black
        button.setTitle("Post", for: .normal)
        
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        
    }
    
    @objc func showPost() {
        
        let PostviewController = PostviewController()
        
        navigationController?.pushViewController(PostviewController, animated: true)
        
    }
}
