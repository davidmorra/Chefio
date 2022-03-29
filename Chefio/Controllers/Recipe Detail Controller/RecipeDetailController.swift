//
//  RecipeDetailController.swift
//  Chefio
//
//  Created by Davit on 25.03.22.
//

import UIKit

enum PopUpState {
    case opened
    case closed
    
    var oposite: PopUpState {
        switch self {
        case .opened:
            return .closed
        case .closed:
            return .opened
        }
    }
}

class RecipeDetailController: UIViewController {
    
    let foodImageView = UIImageView()
    let recipeTitle = RecipeController()
    
    var popUpState: PopUpState = .closed
    let popUpView = UIView()
    
    let grabberView = UIView()
    let gestureView = UIView()
    
    var popUpViewTopConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
    private func style() {
        foodImageView.translatesAutoresizingMaskIntoConstraints = false
//        foodImageView.image = UIImage(named: "food1")

        foodImageView.contentMode = .scaleAspectFill
        foodImageView.backgroundColor = .primary
        
        popUpView.translatesAutoresizingMaskIntoConstraints = false
        popUpView.backgroundColor = .systemBackground
        popUpView.layer.cornerRadius = 36
        popUpView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        grabberView.translatesAutoresizingMaskIntoConstraints = false
        grabberView.backgroundColor = .outline
        grabberView.layer.cornerRadius = 3
        
        gestureView.addGestureRecognizer(panRecognizer)
        gestureView.translatesAutoresizingMaskIntoConstraints = false
        recipeTitle.view.translatesAutoresizingMaskIntoConstraints = false

    }
    
    private func layout() {
        view.addSubview(foodImageView)
        view.addSubview(popUpView)
        popUpView.addSubview(grabberView)
        popUpView.addSubview(gestureView)
        
        
        addChild(recipeTitle)
        popUpView.addSubview(recipeTitle.view)
        recipeTitle.didMove(toParent: self)

        NSLayoutConstraint.activate([
            foodImageView.topAnchor.constraint(equalTo: view.topAnchor),
            foodImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            foodImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            foodImageView.heightAnchor.constraint(equalToConstant: 400),
        
            recipeTitle.view.topAnchor.constraint(equalTo: popUpView.topAnchor, constant: 44),
            recipeTitle.view.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor, constant: 24),
            recipeTitle.view.trailingAnchor.constraint(equalTo: popUpView.trailingAnchor, constant: -24),
            recipeTitle.view.bottomAnchor.constraint(equalTo: popUpView.bottomAnchor),
            
            popUpView.topAnchor.constraint(equalTo: foodImageView.bottomAnchor, constant: -24),
            popUpView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            popUpView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            popUpView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
          
            gestureView.topAnchor.constraint(equalTo: popUpView.topAnchor),
            gestureView.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor),
            gestureView.trailingAnchor.constraint(equalTo: popUpView.trailingAnchor),
            gestureView.heightAnchor.constraint(equalToConstant: 30),
            
            grabberView.topAnchor.constraint(equalTo: popUpView.topAnchor, constant: 12),
            grabberView.centerXAnchor.constraint(equalTo: popUpView.centerXAnchor),
            grabberView.widthAnchor.constraint(equalToConstant: 40),
            grabberView.heightAnchor.constraint(equalToConstant: 5),
        ])
    }
    
    //MARK: Gestrure Recognizer
    lazy var panRecognizer: UIPanGestureRecognizer = {
        let pan = UIPanGestureRecognizer()
        pan.addTarget(self, action: #selector(handleGestureRecognizer(gesture:)))
        return pan
    }()
    
    var initialCenter = CGPoint()
    
    @objc func handleGestureRecognizer(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: popUpView.superview)
//        let velocity = gesture.velocity(in: popUpView.superview)
        
        switch gesture.state {
        case .began:
            self.initialCenter = popUpView.center
            
        case .changed:
            let newCenter = CGPoint(x: initialCenter.x + translation.x, y: initialCenter.y + translation.y)
            popUpView.center.y = newCenter.y

        case .ended:
            dragPopUp()
        default:
            ()
        }
    }
    
    func dragPopUp() {
        popUpState = popUpState.oposite

        switch popUpState {
        case .opened:
            UIView.animate(withDuration: 0.1) {
                self.popUpView.center.y = self.view.safeAreaInsets.top + 500
            }
        case .closed:
            UIView.animate(withDuration: 0.1) {
                self.popUpView.center.y = self.view.safeAreaInsets.top + 240
            }

        }
    }
    
    func closePopOver() {
        
    }
}

