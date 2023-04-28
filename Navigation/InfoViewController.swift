//
//  InfoViewController.swift
//  Navigation
//
//  Created by Валерий Климченко on 20.04.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    //Создаем айлерт
    private lazy var alertButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Перейти", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleShadowColor(.red, for: .focused)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray5
        title = "Info"
        
        view.addSubview(alertButton)
        
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            alertButton.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 20.0
            ),
            alertButton.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -20.0
            ),
            alertButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            alertButton.heightAnchor.constraint(equalToConstant: 44.0)
        ])
        
        
        alertButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        
    }
    
    @objc func showAlert() {
        //Создаем айлерт
        let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
        //Действия при нажатии (сообщение в консоли)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            print("The 'Ok' alert occured.")
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel) { (_) in
            print("The 'Cansel' alert occured.")
        }
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
}
