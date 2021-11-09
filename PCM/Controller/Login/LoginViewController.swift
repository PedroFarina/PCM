//
//  LoginViewController.swift
//  PCM
//
//  Created by Francielly Cristina Ortiz Candido on 11/10/21.
//

import Foundation
import UIKit

internal class LoginViewController: UIViewController {
    
    private lazy var tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
    
    private var logoImage: UIImageView = {
        let logoImage = UIImageView(image: UIImage(named: "PCM Icon"))
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.layer.cornerRadius = 20
        return logoImage
    }()
    
    private lazy var userTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocapitalizationType = .none
        textField.keyboardType = .emailAddress
        textField.placeholder = "Usuário"
        textField.font = .systemFont(ofSize: 15)
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        textField.placeholder = "Senha"
        textField.font = .systemFont(ofSize: 15)
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        label.text = "Bem-vindo!"
        label.textColor = .blackProt
        return label
    }()
    
    private lazy var enterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .yellowProt
        button.layer.cornerRadius = 14
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(.blackProt, for: .normal)
        button.addTarget(self, action: #selector(enterTap(_:)), for: .touchUpInside)
        return button
    }()
    private lazy var constraints: [NSLayoutConstraint] = {
        [
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.2),
            logoImage.heightAnchor.constraint(equalToConstant: 115),
            logoImage.widthAnchor.constraint(equalTo: logoImage.heightAnchor),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            userTextField.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 50),
            userTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            userTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            userTextField.heightAnchor.constraint(equalToConstant: 56),
            
            passwordTextField.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: userTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: userTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 56),

            enterButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
            enterButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor, constant: 15),
            enterButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: -15),
            enterButton.heightAnchor.constraint(equalToConstant: 56)
        ]
    }()
    
    override internal func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .bgColor

        view.addSubview(userTextField)
        view.addSubview(passwordTextField)
        view.addSubview(logoImage)
        view.addSubview(titleLabel)
        view.addSubview(enterButton)
        view.addGestureRecognizer(tap)
    }
    override internal func viewDidLayoutSubviews() {
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc private func enterTap(_ sender: UIButton){
        let vc = ActivitiesViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true)
    }
    
    @objc private func handleTap(_ sender: UITapGestureRecognizer? = nil){
        userTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
}
