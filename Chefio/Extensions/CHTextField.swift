//
//  CHTextField.swift
//  Chefio
//
//  Created by Davit on 28.03.22.
//

import UIKit

enum CHConfiguration {
    case outline
    case validated
    case redStroke
}

class CHTextField: UITextField {
    let imageView = UIImageView()
    var configuration: CHConfiguration = .outline
    
    init(image: UIImage, placeholder: String, configuration: CHConfiguration = .outline) {
        super.init(frame: .zero)
        
        self.imageView.image = image.withConfiguration(UIImage.SymbolConfiguration(weight: .medium))
        self.placeholder = placeholder
        self.configuration = configuration
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func commonInit() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 28

        textFieldStyle()
        
        let view = UIView(frame: CGRect(x: 16, y: 0, width: 20, height: 18))
        view.addSubview(imageView)
        imageView.frame = view.frame
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .mainText
        leftViewMode = .always
        leftView = view
        
        //changing placeholder text
        guard let text = placeholder else { return }
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 15, weight: .medium), range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(.foregroundColor, value: UIColor.placeholder, range: NSRange(location: 0, length: text.count))

        
        attributedPlaceholder = attributedString
//        attributedPlaceholder
    }
    
    func textFieldStyle() {
        switch configuration {
        case .outline:
            layer.borderColor = UIColor.outline.cgColor
            layer.borderWidth = 1
        case .validated:
            layer.borderColor = UIColor.primary.cgColor
            layer.borderWidth = 2

        case .redStroke:
            layer.borderColor = UIColor.systemRed.cgColor
            layer.borderWidth = 2

        }
        
    }
    
    // placeholder position
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 48, dy: 6)
    }

    // text position
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 48, dy: 6)
    }
}
