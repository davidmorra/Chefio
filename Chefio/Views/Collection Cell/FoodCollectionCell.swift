//
//  FoodCollectionCell.swift
//  Chefio
//
//  Created by Davit on 24.03.22.
//

import UIKit

class FoodCollectionCell: UICollectionViewCell {
    
    let author = AuthorCollectionCellView()
    let imageView = UIImageView()
    let likeButton = UIButton()
    let recipeTitleView = RecipeTitleView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        sizeToFit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Style and Layout
    private func style() {
        author.translatesAutoresizingMaskIntoConstraints = false
        author.authorName.text = "Calum Lewis"
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        recipeTitleView.translatesAutoresizingMaskIntoConstraints = false

        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.configuration = UIButton.Configuration.plain()
        
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 13, weight: .bold)
        likeButton.configuration?.baseForegroundColor = .white
        likeButton.configuration?.image = UIImage(systemName: "heart", withConfiguration: imageConfig)
        
        likeButton.applyBlurEffect()
    }
    
    private func layout() {
        contentView.addSubview(author)
        contentView.addSubview(imageView)
        contentView.addSubview(recipeTitleView)
        imageView.addSubview(likeButton)
        
        NSLayoutConstraint.activate([
            author.topAnchor.constraint(equalTo: topAnchor),
            author.leadingAnchor.constraint(equalTo: leadingAnchor),
            author.trailingAnchor.constraint(equalTo: trailingAnchor),
//            author.heightAnchor.constraint(equalToConstant: 32),
            
            imageView.topAnchor.constraint(equalToSystemSpacingBelow: author.bottomAnchor, multiplier: 1),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            likeButton.topAnchor.constraint(equalToSystemSpacingBelow: imageView.topAnchor, multiplier: 2),
            likeButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -16),
            likeButton.widthAnchor.constraint(equalToConstant: 32),
            likeButton.heightAnchor.constraint(equalToConstant: 32),
            
            recipeTitleView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 14),
            recipeTitleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            recipeTitleView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            bottomAnchor.constraint(equalToSystemSpacingBelow: recipeTitleView.bottomAnchor, multiplier: 1),
        ])
    }
}
