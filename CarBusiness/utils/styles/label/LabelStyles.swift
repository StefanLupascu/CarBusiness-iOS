//
//  Styles.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 10.07.2021.
//

import UIKit

enum LabelStyles {
    case title
    case subTitle
    case description
    case alert
}

extension LabelStyles: LabelStyleable {
    
    var font: UIFont {
        switch self {
        case .title:
            return UIFont.boldSystemFont(ofSize: 30)
        case .subTitle:
            return UIFont.boldSystemFont(ofSize: 24)
        case .description, .alert:
            return UIFont.systemFont(ofSize: 18)
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .title, .description, .subTitle:
            return UIColor.white
        case .alert:
            return UIColor.black
        }
    }
    
    var numberOfLines: Int {
        switch self {
        case .title, .description, .subTitle:
            return 0
        case .alert:
            return 1
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .title, .description, .subTitle:
            return UIColor.clear
        case .alert:
            return UIColor.init(displayP3Red: 1, green: 1, blue: 1, alpha: 0.7)
        }
    }
    
    var cornerRadius: CGFloat {
        switch self {
        case .title, .description, .subTitle:
            return 0
        case .alert:
            return 20
        }
    }
    
    var alpha: CGFloat {
        switch self {
        case .title, .description, .subTitle:
            return 1
        case .alert:
            return 0
        }
    }
    
    var attributes: [NSAttributedString.Key : Any] {
        return [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 20)
        ]
    }
}
