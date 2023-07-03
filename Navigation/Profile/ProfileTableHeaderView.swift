//
//  ProfileTableHeaderView.swift
//  Navigation
//
//  Created by Валерий Климченко on 06.05.2023.
//

import UIKit

//Создаем протокол, чтобы ProfileTableHeaderView делегировал полномочия по отрисовки анимации ProfileViewController
protocol ProfileTableHeaderViewDelegate: AnyObject {
    func tapAction(image: UIImage?, imageRect: CGRect)
}

class ProfileTableHeaderView: UIView {
    
    //MARK: private property
    
    //Создаем переменную, имеющую тип делегата, чтобы пожно было подписываться под него
    weak var delegate: ProfileTableHeaderViewDelegate?
    
    let avatarImageView: UIImageView = {
        var view = UIImageView(image: UIImage(named: "11"))
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 3
        view.layer.cornerRadius = 75
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Super Dinozaur"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold, width: .standard)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "per aspera ad astra"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular, width: .standard)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statusTextField: UITextField = {
        let field = UITextField()
        field.textColor = .black
        field.backgroundColor = .white
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.indent(size: 10)
        field.placeholder = "Enter status"
        field.layer.borderColor = UIColor.black.cgColor
        field.font = UIFont.systemFont(ofSize: 15, weight: .regular, width: .standard)
        field.translatesAutoresizingMaskIntoConstraints = false
        
        field.addTarget(self, action: #selector(changeStatus), for: .editingChanged)    //Использую lazy чтобы здесь не было ошибки
        
        field.delegate = self
        
        return field
    }()
    
    private lazy var setStatusButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.yellow, for: .focused)
        button.layer.cornerRadius = 4
        button.setTitleColor(.yellow, for: .selected)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset.height = 4
        button.layer.shadowOffset.width = 4
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(setStatus), for: .touchUpInside)
        
        return button
    }()
    
    private var statusText: String = ""
    
    //MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setupConstraint()
        backgroundColor = .systemGray6
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: private func
    
    //Создаю жест: при нажатии на аватар показывается увеличенная картинка
    private func  setupGesture() {
        let didTapImage = UITapGestureRecognizer(target: self, action: #selector(tapImage))
        avatarImageView.addGestureRecognizer(didTapImage)
    }
    
    @objc func tapImage() {
        //При клике на аватар обращаемся к делегату и реализуем единственную функцию. В функцию передаем картинку и ее фрейм, чтобы можно было сделать анимацию возвращения картинки в исходное состояние
        print("!23")
        delegate?.tapAction(image: avatarImageView.image, imageRect: avatarImageView.frame)
    }
    
    private func addViews() {
        [avatarImageView, fullNameLabel, statusLabel, statusTextField, setStatusButton].forEach { addSubview($0) }
    }

    private func setupConstraint() {
        NSLayoutConstraint.activate([
            
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 150),
            avatarImageView.heightAnchor.constraint(equalToConstant: 150),
            
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 40),
            statusLabel.heightAnchor.constraint(equalToConstant: 20),
            statusLabel.widthAnchor.constraint(equalToConstant: 300),
            
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 20),
            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    //MARK: actions
    @objc func setStatus() {
        if statusText == "" {
            LogInViewController().shakeAnimation(textField: statusTextField)
        } else {
            statusLabel.text = statusText
        }
    }
    
    @objc func changeStatus() {
        statusText = statusTextField.text!
    }
    
}

//MARK: extensions

//Отступ слева у текста в textField
extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}

//Скрытие клавиатуры
extension ProfileTableHeaderView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        statusTextField.endEditing(true)
    }
}
