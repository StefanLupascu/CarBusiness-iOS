//
//  ButtonStyles.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 10.07.2021.
//

import UIKit

enum ButtonStyles {
    case update
    case delete
    case save
}

extension ButtonStyles: ButtonStyleable {
    var cornerRadius: CGFloat {
        switch self {
        case .delete, .update, .save:
            return 15
        }
    }
    
    var borderColor: CGColor {
        switch self {
        case .delete, .update, .save:
            return UIColor.black.cgColor
        }
    }
    
    var borderWidth: CGFloat {
        switch self {
        case .delete, .update, .save:
            return 1
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .delete:
            return UIColor.systemRed
        case .save, .update:
            return UIColor.systemOrange
        }
    }
}
