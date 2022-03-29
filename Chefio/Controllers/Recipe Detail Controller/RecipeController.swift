//
//  RecipeController.swift
//  Chefio
//
//  Created by Davit on 26.03.22.
//

import UIKit

class RecipeController: UIViewController {
    
    let recipeTitle = RecipeTitleView()
    let authorView = AuthorCollectionCellView()
    
    let separator = UIView()
    let ingredients = [
        CheckmarkView(name: "4 Eggs"),
        CheckmarkView(name: "1/2 Butter"),
        CheckmarkView(name: "1/2 Sugar"),
        CheckmarkView(name: "2 Glass of Water"),
    ]
        
    let ingredientsStackView = UIStackView()
    
    override func loadView() {
        super.loadView()
        style()
        layout()
    }
    
    func style() {
        recipeTitle.translatesAutoresizingMaskIntoConstraints = false
        recipeTitle.titleLabel.text = "Cacao Maca Walnut Milk"
        recipeTitle.titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        recipeTitle.categoryLabel.text = "Food"
        recipeTitle.cookTimeLabel.text = "60 mins"
        
        authorView.translatesAutoresizingMaskIntoConstraints = false
        authorView.authorName.text = "Elena Shelby"
        authorView.authorName.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        authorView.imageView.layer.cornerRadius = 16
        
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .outline
        
        ingredientsStackView.translatesAutoresizingMaskIntoConstraints = false
        ingredientsStackView.axis = .vertical
        ingredientsStackView.spacing = 16
    }
    
    func layout() {
        view.addSubview(recipeTitle)
        view.addSubview(authorView)
        view.addSubview(separator)
        view.addSubview(ingredientsStackView)
        
        for i in ingredients {
            ingredientsStackView.addArrangedSubview(i)
        }
        
        NSLayoutConstraint.activate([
            recipeTitle.topAnchor.constraint(equalTo: view.topAnchor),
            recipeTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            recipeTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            authorView.topAnchor.constraint(equalToSystemSpacingBelow: recipeTitle.bottomAnchor, multiplier: 1),
            authorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            authorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            separator.topAnchor.constraint(equalToSystemSpacingBelow: authorView.bottomAnchor, multiplier: 2),
            separator.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1),
            
            ingredientsStackView.topAnchor.constraint(equalToSystemSpacingBelow: separator.bottomAnchor, multiplier: 2),
            ingredientsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ingredientsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
}
