//
//  TextFieldStyleable.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 11.07.2021.
//

import UIKit

protocol TextFieldStyleable {
    var font: UIFont { get }
    var textColor: UIColor { get }
    var numberOfLines: Int { get }
    var backgroundColor: UIColor { get }
    var cornerRadius: CGFloat { get }
    var horizontalPadding: CGFloat { get }
    var attributes: [NSAttributedString.Key: Any] { get }
}
