//
//  IngredientsView.swift
//  Chefio
//
//  Created by Davit on 26.03.22.
//

import UIKit

class CheckmarkView: UIView {
    let ingredientsLabel = UILabel()
    let checkmarkView = UIImageView()
    
    init(name: String) {
        self.ingredientsLabel.text = name

        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
        
    func style() {
        ingredientsLabel.translatesAutoresizingMaskIntoConstraints = false
        ingredientsLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        ingredientsLabel.textColor = .mainText

        checkmarkView.translatesAutoresizingMaskIntoConstraints = false
        checkmarkView.image = UIImage(systemName: "checkmark.circle.fill")
        checkmarkView.tintColor = .primary
    }
    
    func layout() {
        addSubview(checkmarkView)
        addSubview(ingredientsLabel)
        
        NSLayoutConstraint.activate([
            checkmarkView.topAnchor.constraint(equalTo: topAnchor),
            checkmarkView.leadingAnchor.constraint(equalTo: leadingAnchor),
            checkmarkView.widthAnchor.constraint(equalToConstant: 24),
            checkmarkView.heightAnchor.constraint(equalToConstant: 24),
            
            ingredientsLabel.centerYAnchor.constraint(equalTo: checkmarkView.centerYAnchor),
            ingredientsLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: checkmarkView.trailingAnchor, multiplier: 1),
            
            trailingAnchor.constraint(equalTo: ingredientsLabel.trailingAnchor),
            bottomAnchor.constraint(equalTo: checkmarkView.bottomAnchor),
        ])
    }
    
    func changeColor(to color: UIColor) {
        ingredientsLabel.textColor = color
        checkmarkView.tintColor = color
    }
    
}
