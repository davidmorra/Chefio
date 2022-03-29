//
//  AuthorCollectionCellView.swift
//  Chefio
//
//  Created by Davit on 25.03.22.
//

import UIKit

class AuthorCollectionCellView: UIView {
    
    let imageView = UIImageView()
    let authorName = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func style() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.image = UIImage(named: "photo")
        imageView.backgroundColor = .primary
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        authorName.translatesAutoresizingMaskIntoConstraints = false
        authorName.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        authorName.textColor = .mainText
    }
    
    private func layout() {
        addSubview(imageView)
        addSubview(authorName)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 32),
            imageView.heightAnchor.constraint(equalToConstant: 32),
            
            authorName.leadingAnchor.constraint(equalToSystemSpacingAfter: imageView.trailingAnchor, multiplier: 1),
            authorName.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            
            bottomAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 0),
            trailingAnchor.constraint(equalToSystemSpacingAfter: authorName.trailingAnchor, multiplier: 0)
        ])
    }
    
    
}
