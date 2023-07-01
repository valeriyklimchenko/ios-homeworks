//
//  ProfileTableHeaderView.swift
//  Navigation
//
//  Created by Валерий Климченко on 06.05.2023.
//

import UIKit

class ProfileTableHeaderView: UIView {
    
    //MARK: private property
    
    private let whiteView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        return view
    }()
    
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
        backgroundColor = .gray
        setupGesture()
    }
    
    func setupGesture() {
        let AvatarImageViewTap = UITapGestureRecognizer(target: self, action: #selector(avatarImageViewAction))
        let avatar = avatarImageView
        avatar.isUserInteractionEnabled = true
        avatar.addGestureRecognizer(AvatarImageViewTap)
    }
    
    @objc private func avatarImageViewAction() {
//        print("animation")
        avatarImageView.bringSubviewToFront(ProfileTableHeaderView())
        let finalPosition = CGPoint(x: ProfileViewController().view.center.x, y: ProfileViewController().view.center.y)
        let positionAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        positionAnimation.fromValue = avatarImageView.center
        positionAnimation.toValue = finalPosition
        avatarImageView.layer.position = finalPosition
//        avatarImageView.leadingAnchor.co = CGFloat(300)

        let groupAnimation = CAAnimationGroup()
        groupAnimation.duration = 2
        groupAnimation.animations = [positionAnimation]
        groupAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        avatarImageView.layer.add(groupAnimation, forKey: nil)
        
   
        //Анимация позиции
//        let positionAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
//        positionAnimation.fromValue = avatarImageView.center
//        positionAnimation.toValue = CGPoint(x: bounds.width, y: avatarImageView.center.y)
//        //создаем группу
//        let groupAnimayion = CAAnimationGroup()
//        groupAnimayion.duration = 2
//        groupAnimayion.animations = [positionAnimation]
//        //плавное начало и конец
//        groupAnimayion.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
//        //к layer добавляем анимацию (CAAnimation анимирует layer)
//        avatarImageView.layer.add(groupAnimayion, forKey: nil)
//        //Указываем конечные значения (CABasicAnimation)
//        avatarImageView.layer.position = CGPoint(x: bounds.width, y: avatarImageView.center.y)
    }
    
    
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: private func
    
    private func addViews() {
        addSubview(whiteView)
        [avatarImageView, fullNameLabel, statusLabel, statusTextField, setStatusButton].forEach { whiteView.addSubview($0) }
    }
    
    //MARK: life cycle
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            whiteView.leadingAnchor.constraint(equalTo: leadingAnchor),
            whiteView.topAnchor.constraint(equalTo: topAnchor),
            whiteView.trailingAnchor.constraint(equalTo: trailingAnchor),
            whiteView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
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
        if statusText != "" {
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
