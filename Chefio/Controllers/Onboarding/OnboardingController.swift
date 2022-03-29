//
//  OnboardingController.swift
//  Chefio
//
//  Created by Davit on 28.03.22.
//

import UIKit

class OnboardingController: UIViewController {
        
    let imageView = UIImageView()
    let titleLabel = TitleView("Start Cooking", 26, weight: .bold, color: .mainText)
    let secondaryText = TitleView("Let's join our community \nto cook better food!", 16, weight: .medium, color: .secondaryText)
    
    let getStartedButton = UIButton().createButton("Get Started", color: .primary)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.tabBar.isHidden = true
        
        view.backgroundColor = .systemBackground
        
        style()
        layout()
    }
    
    func style() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "onboarding")
        imageView.contentMode = .scaleAspectFill
        
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textLabel.textAlignment = .center
        
        secondaryText.translatesAutoresizingMaskIntoConstraints = false
        secondaryText.textLabel.numberOfLines = 0
        secondaryText.textLabel.textAlignment = .center
//        secondaryText.textLabel.attributedText = NSAttributedString
        
        getStartedButton.translatesAutoresizingMaskIntoConstraints = false
        getStartedButton.addTarget(self, action: #selector(getStartedButtonTapped), for: .touchUpInside)
    }
    
    @objc func getStartedButtonTapped() {
        let vc = LoginController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func layout() {
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(secondaryText)
        view.addSubview(getStartedButton)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 0),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width + 50),
            
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 6),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            secondaryText.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 2),
            secondaryText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            secondaryText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            getStartedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            getStartedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            getStartedButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            getStartedButton.heightAnchor.constraint(equalToConstant: 56),
        ])
    }
    
}
