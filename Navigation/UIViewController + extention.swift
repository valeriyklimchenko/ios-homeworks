//
//  UIViewController + extention.swift
//  Navigation
//
//  Created by Валерий Климченко on 19.06.2023.
//

import UIKit

extension UIViewController {
    
    func makeButton() -> UIButton {
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
        
    }
    
    @objc func showPost() {
        //При обработке нажатия создается экземпляр класса ProfileViewController()
        let PostviewController = PostviewController()
        //Для немодального перехода используется метод present
        navigationController?.pushViewController(PostviewController, animated: true)
        
    }
}
