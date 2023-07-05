//
//  ProfileTableHeaderView.swift
//  Navigation
//
//  Created by Валерий Климченко on 06.05.2023.
//

import UIKit

class ProfileTableHeaderView: UIView {
    
    //MARK: - private property
    var avatarPosition: CGPoint = .zero
    
    private var leadingAvatar = NSLayoutConstraint()
    private var topAvatar = NSLayoutConstraint()
    private var heightAvatar = NSLayoutConstraint()
    private var widthAvatar = NSLayoutConstraint()

    let crossButton: UIImageView = {
        var view = UIImageView(image: UIImage(systemName: "xmark"))
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray3
        return view
    }()
    
    private let viewForAnimation: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.opacity = 0
        return view
    }()
    
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
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setupConstraint()
        setupGesture()
        backgroundColor = .gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - private func
    
    private func setupGesture() {
        let openImageGesture = UITapGestureRecognizer(target: self, action: #selector(openImageAnimation))
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.addGestureRecognizer(openImageGesture)
        
        let closeImageGesture = UITapGestureRecognizer(target: self, action: #selector(closeImageAnimation))
        crossButton.isUserInteractionEnabled = true
        crossButton.addGestureRecognizer(closeImageGesture)
    }
    
    private func addViews() {
        addSubview(whiteView)
        [fullNameLabel, statusLabel, statusTextField, setStatusButton, viewForAnimation, avatarImageView, crossButton].forEach { whiteView.addSubview($0) }
    }
    
    //MARK: - constraints
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            viewForAnimation.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewForAnimation.topAnchor.constraint(equalTo: topAnchor),
            viewForAnimation.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewForAnimation.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            
            whiteView.leadingAnchor.constraint(equalTo: leadingAnchor),
            whiteView.topAnchor.constraint(equalTo: topAnchor),
            whiteView.trailingAnchor.constraint(equalTo: trailingAnchor),
            whiteView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
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
            
            crossButton.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 0),
            crossButton.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -16),
            crossButton.widthAnchor.constraint(equalToConstant: 50),
            crossButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        leadingAvatar = avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        topAvatar = avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16)
        widthAvatar = avatarImageView.widthAnchor.constraint(equalToConstant: 150)
        heightAvatar = avatarImageView.heightAnchor.constraint(equalToConstant: 150)
        NSLayoutConstraint.activate([leadingAvatar, topAvatar, heightAvatar, widthAvatar])
    }
    //MARK: actions
    
    @objc private func openImageAnimation() {
        let width = UIScreen.main.bounds.width - 16
        avatarPosition = avatarImageView.layer.position


        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            self.viewForAnimation.alpha = 0.5
            self.avatarImageView.layer.bounds = CGRect(x: 0, y: 0, width: width, height: width)
            self.avatarImageView.center = CGPoint(x: self.whiteView.center.x, y: self.whiteView.center.y + 200)
            self.layoutIfNeeded()
            self.avatarImageView.layer.cornerRadius = 0
            self.avatarImageView.layer.borderWidth = 0
//            self.layoutIfNeeded()
        } completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 0) {
                self.crossButton.alpha = 1
//                self.layoutIfNeeded()
            }
        }
    }
    
    @objc private func closeImageAnimation() {
        UIView.animate(withDuration: 0.3, delay: 0) {
            self.crossButton.alpha = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0) {
                self.viewForAnimation.alpha = 0
                self.avatarImageView.layer.position = self.avatarPosition
                self.avatarImageView.layer.bounds = CGRect(x: 0, y: 0, width: 150, height: 150)
                self.avatarImageView.layer.cornerRadius = self.avatarImageView.bounds.width / 2
                self.layoutIfNeeded()
            }
        }
    }


    
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
