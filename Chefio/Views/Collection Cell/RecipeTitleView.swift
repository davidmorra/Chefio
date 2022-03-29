//
//  RecipeTitleView.swift
//  Chefio
//
//  Created by Davit on 26.03.22.
//

import UIKit

class RecipeTitleView: UIView {
    let titleLabel = UILabel()
    
    let categoryLabel = UILabel()
    let cookTimeLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func style() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        titleLabel.textColor = .mainText
        
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        categoryLabel.textColor = .secondaryText
        
        cookTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        cookTimeLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        cookTimeLabel.textColor = .secondaryText

    }
    
    private func layout() {
        addSubview(titleLabel)
        addSubview(categoryLabel)
        addSubview(cookTimeLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            categoryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            cookTimeLabel.leadingAnchor.constraint(equalTo: categoryLabel.trailingAnchor, constant: 16),
            cookTimeLabel.centerYAnchor.constraint(equalTo: categoryLabel.centerYAnchor),

            bottomAnchor.constraint(equalToSystemSpacingBelow: categoryLabel.bottomAnchor, multiplier: 1),
        ])
    }
}
