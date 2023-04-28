//
//  InfoViewController.swift
//  Navigation
//
//  Created by Валерий Климченко on 20.04.2023.
//

import UIKit

class InfoViewController: UIViewController {
  
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
        
        
        alertButton.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        
    }
    
    @objc func showPost() {
        
        let PostviewController = PostviewController()
        
        navigationController?.pushViewController(PostviewController, animated: true)
        
        let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "ok action"), style: .default, handler: { _ in
        NSLog("The 'Ok' alert occured.")
        }))
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("Cansel", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The 'Cansel' alert occured.")
        }))
        
        self.present(alert, animated: true, completion: nil)
    
    }
}
