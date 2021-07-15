//
//  LabelStyleable.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 10.07.2021.
//

import UIKit

protocol LabelStyleable {
    
    var font: UIFont { get }
    var textColor: UIColor { get }
    var numberOfLines: Int { get }
    var backgroundColor: UIColor { get }
    var cornerRadius: CGFloat { get }
    var alpha: CGFloat { get }
    var attributes: [NSAttributedString.Key: Any] { get }
}
