//
//  HomeViewController.swift
//  Chefio
//
//  Created by Davit on 24.03.22.
//

import UIKit

class HomeViewController: UIViewController {
    
    let headerView = HeaderView()
    let categoryView = CategoryView()
    let safeAreaView = UIView()
    
    var categoryViewTopConstraint: NSLayoutConstraint?
    
    let foodCollectionView: UICollectionView = {
        let cell = (UIScreen.main.bounds.width - 16) / 2 - 20
        let flow = UICollectionViewFlowLayout()
        
        flow.itemSize = CGSize(width: cell, height: cell + 110)
        flow.minimumLineSpacing = 48
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flow)
        return collection
    }()
    
    override func viewDidLoad() {
        style()
        layout()
        
        setupCollectionView()
    }
    
    func setupCollectionView() {
        foodCollectionView.delegate = self
        foodCollectionView.dataSource = self
        foodCollectionView.register(FoodCollectionCell.self, forCellWithReuseIdentifier: K.foodCell)
    }
    
    func style() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        foodCollectionView.translatesAutoresizingMaskIntoConstraints = false
        safeAreaView.translatesAutoresizingMaskIntoConstraints = false
        safeAreaView.backgroundColor = headerView.backgroundColor
    }
    
    func layout() {
        view.addSubview(headerView)
        view.insertSubview(categoryView, belowSubview: headerView)
        view.insertSubview(safeAreaView, belowSubview: headerView)
        view.addSubview(foodCollectionView)
        
        categoryViewTopConstraint = categoryView.topAnchor.constraint(equalToSystemSpacingBelow: headerView.bottomAnchor, multiplier: 0)
        
        NSLayoutConstraint.activate([
            safeAreaView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            safeAreaView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            safeAreaView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            safeAreaView.heightAnchor.constraint(equalToConstant: 60),
            
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            categoryViewTopConstraint!,
            categoryView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            foodCollectionView.topAnchor.constraint(equalToSystemSpacingBelow: categoryView.bottomAnchor, multiplier: 1),
            foodCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            foodCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            foodCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    //MARK: To hide Category View
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        let sholdStop = y > 30
    
        UIView.animate(withDuration: 0.2) {
            self.categoryViewTopConstraint?.constant = sholdStop ? -self.categoryView.frame.height : 0
            self.view.layoutIfNeeded()
        }
    }
}

//MARK: - CollectionView Methods
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.foodCell, for: indexPath) as? FoodCollectionCell else { return UICollectionViewCell() }
        
        cell.recipeTitleView.titleLabel.text = "Pancake"
//        cell.imageView.image = UIImage(named: "food\(indexPath.row)")
        cell.imageView.backgroundColor = .mainText
        cell.recipeTitleView.categoryLabel.text = "Food"
        cell.recipeTitleView.cookTimeLabel.text = ">60 mins"
        
        return cell
    }
}

//MARK: - CollectionView flow layout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 18, left: 18, bottom: 18, right: 18)
    }
}
