//
//  InitialScreen.swift
//  PCM
//
//  Created by Francielly Cristina Ortiz Candido on 11/10/21.
//

import Foundation
import UIKit

class InitialScreenViewController: UIViewController, UITextFieldDelegate{
    
    var logoImage: UIView = UIView ()
    var titleLabel: UILabel = UILabel()
    let userTextField = UITextField(frame: CGRect(x: 20, y: 100, width: 300, height: 40))
    let passwordTextField = UITextField(frame: CGRect(x: 20, y: 100, width: 300, height: 40))
   
    let enterButton = UIButton ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 254.0/255.0, green: 254.0/255.0, blue: 254.0/255.0, alpha: 1.0)
        logoImage.backgroundColor = .systemGray3
        logoImage.layer.cornerRadius = 20
        
        titleLabel.text = "Bem-vindo!"
        titleLabel.textColor = UIColor(red: 60.0/255.0, green: 60.0/255.0, blue: 67.0/255.0, alpha: 1.0)
        titleLabel.font = .systemFont(ofSize: 32, weight: .regular)
        
        userTextField.placeholder = "Usuário"
        userTextField.font = UIFont.systemFont(ofSize: 15)
        userTextField.borderStyle = UITextField.BorderStyle.roundedRect
        userTextField.autocorrectionType = UITextAutocorrectionType.no
        userTextField.keyboardType = UIKeyboardType.default
        userTextField.returnKeyType = UIReturnKeyType.done
        userTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        userTextField.delegate = self
        
        
        
        passwordTextField.placeholder = "Senha"
        passwordTextField.font = UIFont.systemFont(ofSize: 15)
        passwordTextField.borderStyle = UITextField.BorderStyle.roundedRect
        passwordTextField.autocorrectionType = UITextAutocorrectionType.no
        passwordTextField.keyboardType = UIKeyboardType.default
        passwordTextField.returnKeyType = UIReturnKeyType.done
        passwordTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        passwordTextField.delegate = self

        
        
        
        enterButton.backgroundColor = UIColor(red: 246.0/255.0, green: 219.0/255.0, blue: 147.0/255.0, alpha: 1.0)
        enterButton.layer.cornerRadius = 14
        enterButton.setTitle("Entrar", for: .normal)
        enterButton.setTitleColor(UIColor(red: 60.0/255.0, green: 60.0/255.0, blue: 67.0/255.0, alpha: 1.0), for: .normal)
        

        view.addSubview(userTextField)
        view.addSubview(passwordTextField)
        view.addSubview(logoImage)
        view.addSubview(titleLabel)
        view.addSubview(enterButton)
        addConstraints()
    }
    
    func addConstraints() {
    
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height/5).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 115).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 115).isActive = true
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: view.frame.height/20).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        userTextField.translatesAutoresizingMaskIntoConstraints = false
        userTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userTextField.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: view.frame.height/10).isActive = true
        userTextField.heightAnchor.constraint(equalToConstant: 56).isActive = true
        userTextField.widthAnchor.constraint(equalToConstant: 343).isActive = true
        
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 10).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 56).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: 343).isActive = true
        
        enterButton.translatesAutoresizingMaskIntoConstraints = false
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
