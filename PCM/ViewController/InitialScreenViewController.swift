//
//  InitialScreen.swift
//  PCM
//
//  Created by Francielly Cristina Ortiz Candido on 11/10/21.
//

import Foundation
import UIKit

class InitialScreenViewController: UIViewController, UITextFieldDelegate{
    
    private var logoImage: UIView = {
        let logoImage = UIView()
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.backgroundColor = .systemGray3
        logoImage.layer.cornerRadius = 20
        return logoImage
    }()
    
    private lazy var userTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Usuário"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.delegate = self
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Senha"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.delegate = self
        return textField
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        label.text = "Bem-vindo!"
        // TODO: mudar cor pra asset dark/light mode
        label.textColor = UIColor(red: 60.0/255.0, green: 60.0/255.0, blue: 67.0/255.0, alpha: 1.0)
        return label
    }()
    
    private var enterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 246.0/255.0, green: 219.0/255.0, blue: 147.0/255.0, alpha: 1.0)
        button.layer.cornerRadius = 14
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(UIColor(red: 60.0/255.0, green: 60.0/255.0, blue: 67.0/255.0, alpha: 1.0), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 254.0/255.0, green: 254.0/255.0, blue: 254.0/255.0, alpha: 1.0)
    

        view.addSubview(userTextField)
        view.addSubview(passwordTextField)
        view.addSubview(logoImage)
        view.addSubview(titleLabel)
        view.addSubview(enterButton)
        addConstraints()
    }
    
    func addConstraints() {
    
        logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height/5).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 115).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 115).isActive = true
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       
    
        titleLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: view.frame.height/20).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        userTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userTextField.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: view.frame.height/10).isActive = true
        userTextField.heightAnchor.constraint(equalToConstant: 56).isActive = true
        userTextField.widthAnchor.constraint(equalToConstant: 343).isActive = true
        
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 10).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 56).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: 343).isActive = true
        
        enterButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: view.frame.height/8).isActive = true
        enterButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
        enterButton.widthAnchor.constraint(equalToConstant: 288).isActive = true
        enterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
           // return NO to disallow editing.
           print("TextField should begin editing method called")
           return true
       }

       func textFieldDidBeginEditing(_ textField: UITextField) {
           // became first responder
           print("TextField did begin editing method called")
       }

       func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
           // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
           print("TextField should snd editing method called")
           return true
       }

       func textFieldDidEndEditing(_ textField: UITextField) {
           // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
           print("TextField did end editing method called")
       }

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
           // if implemented, called in place of textFieldDidEndEditing:
           print("TextField did end editing with reason method called")
       }

       func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
           // return NO to not change text
           print("While entering the characters this method gets called")
           return true
       }

       func textFieldShouldClear(_ textField: UITextField) -> Bool {
           // called when clear button pressed. return NO to ignore (no notifications)
           print("TextField should clear method called")
           return true
       }

       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           // called when 'return' key pressed. return NO to ignore.
           print("TextField should return method called")
           // may be useful: textField.resignFirstResponder()
           return true
       }
  
}
