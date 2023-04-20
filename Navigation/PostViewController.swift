import UIKit

class PostviewController: UIViewController {
    
    //Создаем дочерний класс UIButton
    private lazy var actionButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Info", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Post"
        view.backgroundColor = .systemCyan
        
        view.addSubview(actionButton)
        
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            actionButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20
                                                 ),
            actionButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
                        actionButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
                        actionButton.heightAnchor.constraint(equalToConstant: 44.0)
                    ])

        
        //actionButton содержит обработчик нажатия на себя. При нажатии на кнопку сработает метод ButtonPressed и вызовется нижеуказанный код
        actionButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        }
    
    @objc func  buttonPressed(_: UIButton) {
        
        //При обработке нажатия создается экземпляр класса ProfileViewController()
        let InfoViewController = InfoViewController()
    
        //Далее запускается его модальное отображение (как подпроцесс)
        InfoViewController.modalTransitionStyle = .coverVertical
        InfoViewController.modalPresentationStyle = .formSheet
        
        //Для перехода используется метод present
        present(InfoViewController, animated: true)

    }
}

