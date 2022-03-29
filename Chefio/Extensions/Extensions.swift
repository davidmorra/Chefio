//
//  UIColorExtension.swift
//  Chefio
//
//  Created by Davit on 25.03.22.
//

import UIKit

extension UIColor {
    static let mainText = UIColor(named: "mainText")!
    static let secondaryText = UIColor(named: "secondaryText")!
    static let primary = UIColor(named: "primary")!
    static let outline = UIColor(named: "outline")!
    static let placeholder = UIColor(named: "placeholder")!
}

extension NSAttributedString {
    func spacing(_ space: CGFloat) -> NSAttributedString {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = space
        let attributes = [NSAttributedString.Key.paragraphStyle : style]
//        self.attributedText = NSAttributedString(string: self.text!, attributes: attributes)

        return NSAttributedString(string: self.string, attributes: attributes)
    }
}

extension UIButton {
    func applyBlurEffect() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        blurEffectView.frame = bounds
        blurEffectView.layer.cornerRadius = 8
        blurEffectView.clipsToBounds = true
        blurEffectView.alpha = 0.7
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
    }
    
    func createButton(_ title: String, color: UIColor) -> UIButton {
        var configuration = UIButton.Configuration.filled()
        
        configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = color
        
        if color == UIColor.systemGray6 {
            configuration.baseForegroundColor = .secondaryText
        } else {
            configuration.baseForegroundColor = .white
        }
        
        
        configuration.buttonSize = .large
        
        var attText = AttributedString.init(title)
        attText.font = .systemFont(ofSize: 16, weight: .bold)
        configuration.attributedTitle = attText
        configuration.cornerStyle = .capsule
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 24, bottom: 15, trailing: 24)

        self.configuration = configuration
        
        return self
    }
}
