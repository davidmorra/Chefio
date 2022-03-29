//
//  MainTabBarController.swift
//  Chefio
//
//  Created by Davit on 24.03.22.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func loadView() {
        super.loadView()

        tabBarAppearance()
        
        viewControllers = [
            setupControllers(HomeViewController(), image: "house.fill", title: "Home"),
            setupControllers(SearchViewController(), image: "magnifyingglass", title: "Search"),
            setupControllers(RecipeDetailController(), image: "cube.fill", title: "Detail"),
        ]
        
        tabBar.tintColor = .primary
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        view.backgroundColor = .systemGray6

    }
    
    func setupControllers(_ controller: UIViewController, image: String, title: String) -> UIViewController {
        let viewController = controller
        viewController.tabBarItem.image = UIImage(systemName: image)
        viewController.title = title
        viewController.navigationController?.navigationBar.isHidden = true
        
        return viewController
    }
    
    func tabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .systemBackground
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
}
