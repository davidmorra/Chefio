//
//  LoginController.swift
//  Chefio
//
//  Created by Davit on 28.03.22.
//

import UIKit

class LoginController: UIViewController {
    
    let imageView = UIImageView()

    let welcomeLabel = TitleView("Welcome Back!", 26, weight: .bold, color: .mainText)
    let secondaryText = TitleView("Please enter your account here", 16, weight: .regular, color: .secondaryText)
    
    let emailTextField = CHTextField(image: UIImage(systemName: "envelope")!, placeholder: "Email or phone number")
    let passwordTextField = CHTextField(image: UIImage(systemName: "lock")!, placeholder: "Password")
    
    let loginButton = UIButton().createButton("Login", color: .primary)
    let singupButton = UIButton()
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .systemBackground
                
        style()
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func style() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "login")
        imageView.contentMode = .scaleAspectFill

        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.textLabel.textAlignment = .center
        
        secondaryText.translatesAutoresizingMaskIntoConstraints = false
        secondaryText.textLabel.textAlignment = .center
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.isSecureTextEntry = true
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        singupButton.configuration = .plain()
        singupButton.translatesAutoresizingMaskIntoConstraints = false
//        singupButton.configuration?.title = "Sing Up"
        singupButton.configuration?.baseForegroundColor = .systemBlue
    
        var attText = AttributedString.init("Sing Up")
        attText.font = .systemFont(ofSize: 15, weight: .medium)
        singupButton.configuration?.attributedTitle = attText
        
        singupButton.addTarget(self, action: #selector(singUpButtonTapped), for: .touchUpInside)
    }
    
    @objc func loginButtonTapped() {
        let vc = MainTabBarController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func singUpButtonTapped() {
        let vc = SingUpController()
        
        navigationController?.pushViewController(vc, animated: true)
    }

    
    func layout() {
        view.addSubview(imageView)
        view.addSubview(welcomeLabel)
        view.addSubview(secondaryText)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(singupButton)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 2),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),

            welcomeLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
    
            secondaryText.topAnchor.constraint(equalToSystemSpacingBelow: welcomeLabel.bottomAnchor, multiplier: 1),
            secondaryText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            secondaryText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            emailTextField.topAnchor.constraint(equalToSystemSpacingBelow: secondaryText.bottomAnchor, multiplier: 2),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            emailTextField.heightAnchor.constraint(equalToConstant: 56),
            
            passwordTextField.topAnchor.constraint(equalToSystemSpacingBelow: emailTextField.bottomAnchor, multiplier: 2),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            passwordTextField.heightAnchor.constraint(equalToConstant: 56),
            
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            loginButton.bottomAnchor.constraint(equalTo: singupButton.topAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 56),
            
            singupButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            singupButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            singupButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
//            singupButton.heightAnchor.constraint(equalToConstant: 24),
        ])
    }
}
