//
//  TitleView.swift
//  Chefio
//
//  Created by Davit on 28.03.22.
//

import UIKit

class TitleView: UIView {
    let textLabel = UILabel()
    
    init(_ text: String, _ size: CGFloat = 18, weight: UIFont.Weight, color: UIColor) {
        textLabel.font = UIFont.systemFont(ofSize: size, weight: weight)
        textLabel.textColor = color
        
        textLabel.text = text
        
        super.init(frame: .zero)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func style() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func layout() {
        addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: topAnchor),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            trailingAnchor.constraint(equalTo: textLabel.trailingAnchor),
            bottomAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 4),
        ])
    }
    
    
}
