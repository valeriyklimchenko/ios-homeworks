//
//  LogInViewController.swift
//  Navigation
//
//  Created by Валерий Климченко on 30.05.2023.
//

import UIKit

class LogInViewController: UIViewController {
   
    //MARK: - Properties
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let loginView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let logo: UIImageView = {
        let view = UIImageView(image: UIImage(named: "logo"))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let stackViewForTextField: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 10
        view.backgroundColor = .systemGray6
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var emailTextField: UITextField = {
        let email = UITextField()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.placeholder = "Email or phone"
        email.indent(size: 10)
        email.isSecureTextEntry = true
        email.textColor = .black
        email.font = UIFont(name: "defolt", size: 16)
        email.tintColor = .black
        email.autocapitalizationType = .none
        email.isSecureTextEntry = false
        
        email.delegate = self
        
        return email
    }()
    
    private let textDelimeter: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    private lazy var passwordTextField: UITextField = {
        let pass = UITextField()
        pass.translatesAutoresizingMaskIntoConstraints = false
        pass.placeholder = "Password"
        pass.indent(size: 10)
        pass.textColor = .black
        pass.font = UIFont(name: "sistem", size: 16)
        pass.autocapitalizationType = .none
        pass.isSecureTextEntry = true
        
        pass.delegate = self
        
        return pass
    }()
    
    private lazy var numberOfSymbols: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.text = "Пароль дожен содержать более 4 символов"
        label.isHidden = true
        label.font = UIFont(name: "sistem", size: 14)
        return label
    }()
    
    private let logInButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        let image = UIImage(named: "blue_pixel") as UIImage?
        button.setBackgroundImage(image, for: .normal)
        button.tintColor = .white
        button.setTitle("Log in", for: .normal)
        button.clipsToBounds = true
        
        switch button.state {
             case .normal      : button.alpha = 1
             case .selected    : button.alpha = 0.8
             case .highlighted : button.alpha = 0.8
             case .disabled    : button.alpha = 0.8
             default: button.alpha = 1
             }
        
        button.addTarget(nil, action: #selector(goToProfileViewController), for: .touchUpInside)
        
        return button
    }()
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        layout()
    }
    
//MARK: - Funcs
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    //MARK: - Actions
    @objc func goToProfileViewController() {
        numberOfSymbols.isHidden = true
        emailTextField.textColor = .black
        //Пустое поле - подернивание
        if emailTextField.text == "" {
            shakeAnimation(textField: emailTextField)
        }
        else if passwordTextField.text == "" {
            shakeAnimation(textField: passwordTextField)
        }
        
        //Проверка на количество символов пароля
        else if (passwordTextField.text?.count ?? 0) < 4 {
            numberOfSymbols.isHidden = false
        }
        
        //Проверка валидности email
        //Использую forseUnwrap потому что ароверка на пустое поле выше
        else if isValidEmail(emailTextField.text!) == false {
            print("no valid")
            emailTextField.textColor = .red
        }
        
//        Успешная авторизация
        else if emailTextField.text == "admin@mail.ru", passwordTextField.text == "1111" {
            navigationController?.pushViewController(ProfileViewController(), animated: true)
        } else {
            showAlert()
        }
    }
        
    

    
    @objc private func showAlert() {
        //Создаем айлерт
        let alert = UIAlertController(title: "Authorization failed", message: "Enter the correct username and password", preferredStyle: .alert)
        //Действия при нажатии (сообщение в консоли)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
        }

        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
        
        
    }

//MARK: - Animations
    func shakeAnimation(textField: UITextField) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: textField.center.x - 10, y: textField.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: textField.center.x + 10, y: textField.center.y))

        textField.layer.add(animation, forKey: "position")
    }
        
//MARK: - Layout
    private func layout() {
        let safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
        
        scrollView.addSubview(loginView)
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            loginView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            loginView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            loginView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
        
        [logo, stackViewForTextField, numberOfSymbols].forEach { loginView.addSubview($0)}
        NSLayoutConstraint.activate([
            logo.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            logo.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 120),
            logo.widthAnchor.constraint(equalToConstant: 100),
            logo.heightAnchor.constraint(equalToConstant: 100),
            
            stackViewForTextField.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 16),
            stackViewForTextField.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 120),
            stackViewForTextField.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -16),
            stackViewForTextField.heightAnchor.constraint(equalToConstant: 101),
            stackViewForTextField.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            
            numberOfSymbols.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 16),
            numberOfSymbols.topAnchor.constraint(equalTo: stackViewForTextField.bottomAnchor, constant: 3)
        ])
        
        [emailTextField, textDelimeter, passwordTextField].forEach { stackViewForTextField.addSubview($0) }
        NSLayoutConstraint.activate([
            emailTextField.leadingAnchor.constraint(equalTo: stackViewForTextField.leadingAnchor),
            emailTextField.topAnchor.constraint(equalTo: stackViewForTextField.topAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: stackViewForTextField.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            textDelimeter.leadingAnchor.constraint(equalTo: stackViewForTextField.leadingAnchor),
            textDelimeter.topAnchor.constraint(equalTo: emailTextField.bottomAnchor),
            textDelimeter.trailingAnchor.constraint(equalTo: stackViewForTextField.trailingAnchor),
            textDelimeter.heightAnchor.constraint(equalToConstant: 1),

            passwordTextField.leadingAnchor.constraint(equalTo: stackViewForTextField.leadingAnchor),
            passwordTextField.topAnchor.constraint(equalTo: textDelimeter.bottomAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: stackViewForTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 49),
        ])
        
        scrollView.addSubview(logInButton)
        NSLayoutConstraint.activate([
            logInButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            logInButton.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
    }
    
}

//MARK: - extentions
extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
}
    
