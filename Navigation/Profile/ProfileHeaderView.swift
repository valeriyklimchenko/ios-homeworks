//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Валерий Климченко on 06.05.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    //MARK: private property
    
    private let avatarView: UIView = {
        let view = UIView()
        view.layer.contents = UIImage(named: "cat")?.cgImage
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 3
        view.layer.cornerRadius = 75
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Super Cat"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold, width: .standard)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusTextLabel: UILabel = {
        let label = UILabel()
        label.text = "per aspera ad astra"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular, width: .standard)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusTextField: UITextField = {
        let field = UITextField()
        field.text = ""
        field.textColor = .black
        field.backgroundColor = .white
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        field.font = UIFont.systemFont(ofSize: 15, weight: .regular, width: .standard)
        field.translatesAutoresizingMaskIntoConstraints = false
        
        field.addTarget(self, action: #selector(changeStatus), for: .editingChanged)
        
        return field
    }()
    
    private lazy var setStatusButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.yellow, for: .focused)    //Подскажите пожалуйста, почему при наведении цвет не меняется на оранж
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARC: private func
    private func addViews() {
        addSubview(avatarView)
        addSubview(headerLabel)
        addSubview(statusTextLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)
    }
    
    //MARK: life cycle
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            avatarView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarView.widthAnchor.constraint(equalToConstant: 150),
            avatarView.heightAnchor.constraint(equalToConstant: 150),
            
            headerLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 20),
            headerLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerLabel.heightAnchor.constraint(equalToConstant: 30),
            
            statusTextLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 20),
            statusTextLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 40),
            statusTextLabel.heightAnchor.constraint(equalToConstant: 20),
            statusTextLabel.widthAnchor.constraint(equalToConstant: 300),
            
            statusTextField.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 20),
            statusTextField.topAnchor.constraint(equalTo: statusTextLabel.bottomAnchor, constant: 10),
            statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 20),
            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    //MARK: actions
    @objc func setStatus() {
        if statusText != "" {
            statusTextLabel.text = statusText
            statusTextField.text = ""
        }
    }
    
    @objc func changeStatus() {
        statusText = statusTextField.text!
    }
    
}
