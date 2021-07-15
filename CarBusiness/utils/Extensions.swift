//
//  Extensions.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 10.07.2021.
//

import UIKit

extension UILabel {
    
    func applyStyle(style: LabelStyles) {
        textColor = style.textColor
        font = style.font
        numberOfLines = style.numberOfLines
        layer.backgroundColor = style.backgroundColor.cgColor
        layer.cornerRadius = style.cornerRadius
        alpha = style.alpha
    }
}

extension UITextField {
    
    func applyStyle(style: TextFieldStyles) {
        textColor = style.textColor
        font = style.font
        layer.backgroundColor = style.backgroundColor.cgColor
        layer.cornerRadius = style.cornerRadius
        setHorizontalPadding(offset: style.horizontalPadding)
    }
    
    func setHorizontalPadding(offset: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: offset, height: 0))
        leftView = paddingView
        rightView = paddingView
        leftViewMode = .always
        rightViewMode = .always
    }
}

extension UIButton {
    
    func applyStyle(style: ButtonStyles) {
        backgroundColor = style.backgroundColor
        layer.borderWidth = style.borderWidth
        layer.borderColor = style.borderColor
        layer.cornerRadius = style.cornerRadius
    }
}
