//
//  RegestirationViewController.swift
//  Instagram
//
//  Created by Abdelrahman Moustafa on 1/17/21.
//

import UIKit

class RegestirationViewController: UIViewController {
    
    struct Constants {
        
        static let cornerRadius: CGFloat = 8.0
        static let fieldHight: CGFloat = 52
        
    }
    private let usernameField: UITextField = {
        let field =  UITextField()
        field.placeholder = "Username"
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        
        
        return field
    }()
    private let emailField: UITextField = {
        let field =  UITextField()
        field.placeholder = "Email"
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        
        
        return field
    }()
    private let passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password"
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    private let registerationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        registerationButton.addTarget(self,
                                      action: #selector(didTapRegister),
                                      for: .touchUpInside)
        usernameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        view.addSubview(usernameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(registerationButton)
        view.backgroundColor = .systemBackground

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        usernameField.frame = CGRect(x: 20,
                                     y: view.safeAreaInsets.top + 100,
                                     width: view.width - 40,
                                     height: 52)
        emailField.frame = CGRect(x: 20,
                                     y: usernameField.bottom + 10,
                                     width: view.width - 40,
                                     height: 52)
        passwordField.frame = CGRect(x: 20,
                                     y: emailField.bottom + 10,
                                     width: view.width - 40,
                                     height: 52)
        registerationButton.frame = CGRect(x: 20,
                                     y: passwordField.bottom + 10,
                                     width: view.width - 40,
                                     height: 52)
    }
    
    @objc func didTapRegister() {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        usernameField.resignFirstResponder()
        guard let username = usernameField.text, !username.isEmpty,
              let password = passwordField.text, !password.isEmpty , password.count >= 8,
              let  email = emailField.text, !email.isEmpty else {
            return
        }
        AuthManager.shared.registerNewUser(username: username, email: email, password: password ){ registerd in
            DispatchQueue.main.async {
                if registerd {
                    // good to go
                    
                }
                else {
                    // failed
                    
                }
            }
           
            
        }
        
    }

}

extension RegestirationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField {
            emailField.becomeFirstResponder()
        }
        else if textField == emailField {
            passwordField.becomeFirstResponder()
        }
        else {
            didTapRegister()
        }
        return true
    }
}
