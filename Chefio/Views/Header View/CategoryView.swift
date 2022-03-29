//
//  CategoryView.swift
//  Chefio
//
//  Created by Davit on 24.03.22.
//

import UIKit

class CategoryView: UIView {
    
    let categoryLabel = TitleView("Category", 20, weight: .bold, color: .mainText)
    
    let categoryButton = UIButton().createButton("All", color: .primary)
    let categoryButton2 = UIButton().createButton("Food", color: .systemGray6)
    let categoryButton3 = UIButton().createButton("Drinks", color: .systemGray6)
    let categoryButton4 = UIButton().createButton("Pizza", color: .systemGray6)
    let categoryButton5 = UIButton().createButton("Shawarma", color: .systemGray6)
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func style() {
        backgroundColor = .systemBackground
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 16

        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
  
        categoryButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        addSubview(categoryLabel)
        addSubview(scrollView)
        
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(categoryButton)
        stackView.addArrangedSubview(categoryButton2)
        stackView.addArrangedSubview(categoryButton3)
        stackView.addArrangedSubview(categoryButton4)
        stackView.addArrangedSubview(categoryButton5)
        
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            categoryLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            scrollView.topAnchor.constraint(equalToSystemSpacingBelow: categoryLabel.bottomAnchor, multiplier: 2),
            scrollView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 0),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 50),
            
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            trailingAnchor.constraint(equalToSystemSpacingAfter: categoryLabel.trailingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: scrollView.bottomAnchor, multiplier: 2),
        ])
    }
    
    
}
