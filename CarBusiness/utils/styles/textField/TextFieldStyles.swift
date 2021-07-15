//
//  TextFieldStyles.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 11.07.2021.
//

import UIKit

enum TextFieldStyles {
    case mainTextField
}

extension TextFieldStyles: TextFieldStyleable {
    
    var font: UIFont {
        switch self {
        case .mainTextField:
            return UIFont.systemFont(ofSize: 18)
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .mainTextField:
            return UIColor.white
        }
    }
    
    var numberOfLines: Int {
        switch self {
        case .mainTextField:
            return 0
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .mainTextField:
            return #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        }
    }
    
    var cornerRadius: CGFloat {
        switch self {
        case .mainTextField:
            return 5
        }
    }
    
    var horizontalPadding: CGFloat {
        switch self {
        case .mainTextField:
            return 10
        }
    }
    
    var attributes: [NSAttributedString.Key : Any] {
        return [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 20)
        ]
    }
}
