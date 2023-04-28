////
////  ViewController.swift
////  Navigation
////
////  Created by Валерий Климченко on 12.04.2023.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//
////    private lazy var actionButton: UIButton = {
////        let button = UIButton()
////        button.translatesAutoresizingMaskIntoConstraints = false
////        button.setTitle("Перейти", for: .normal)
////        button.setTitleColor(.systemBlue, for: .normal)
////        button.setTitleShadowColor(.red, for: .focused)
////
////        return button
////    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        //actionButton добавляем в иерархию корневого view VC
//        view.addSubview(actionButton)
//        
//        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
//        NSLayoutConstraint.activate([
//            actionButton.leadingAnchor.constraint(
//                equalTo: safeAreaLayoutGuide.leadingAnchor,
//                constant: 20.0
//            ),
//            actionButton.trailingAnchor.constraint(
//                equalTo: safeAreaLayoutGuide.trailingAnchor,
//                constant: -20.0
//            ),
//            actionButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
//            actionButton.heightAnchor.constraint(equalToConstant: 44.0)
//        ])
//        
//        
//        //actionButton содержит обработчик нажатия на себя. При нажатии на кнопку сработает метод ButtonPressed и вызовется нижеуказанный код
//        actionButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
//    }
//    
//    @objc func buttonPressed(_ sender: UIButton) {
//        //При обработке нажатия создается экземпляр класса ProfileViewController() и запускается его модальное отображение (как подпроцесс)
//        let profileViewController = ProfileViewController()
//        
//        profileViewController.modalTransitionStyle = .crossDissolve //анимация
//        profileViewController.modalPresentationStyle = .formSheet   //конечное состояние
//        
//        //Для перехода используется метод present
//        present(profileViewController, animated: true)
//    }
//}
