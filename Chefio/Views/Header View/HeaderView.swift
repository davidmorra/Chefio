//
//  HeaderView.swift
//  Chefio
//
//  Created by Davit on 24.03.22.
//

import UIKit

class HeaderView: UIView {
    
    let textField = UITextField()
    let searchImage = UIImageView(image: UIImage(systemName: "magnifyingglass"))
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        layout()
        style()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func style() {
        backgroundColor = .systemBackground
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Search"
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 30
        textField.clearButtonMode = .whileEditing
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 46, height: textField.frame.size.height))
        textField.leftViewMode = .always
    
        searchImage.translatesAutoresizingMaskIntoConstraints = false
        searchImage.preferredSymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 18, weight: .regular)
        searchImage.tintColor = .label.withAlphaComponent(0.6)
    }
    
    func layout() {
        addSubview(textField)
        textField.addSubview(searchImage)
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textField.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            textField.heightAnchor.constraint(equalToConstant: 56),
            
            searchImage.leadingAnchor.constraint(equalToSystemSpacingAfter: textField.leadingAnchor, multiplier: 2),
            searchImage.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            
            bottomAnchor.constraint(equalToSystemSpacingBelow: textField.bottomAnchor, multiplier: 2)
        ])
    }
}
