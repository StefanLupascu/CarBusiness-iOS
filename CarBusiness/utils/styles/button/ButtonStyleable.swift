//
//  ButtonStyleable.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 10.07.2021.
//

import UIKit

protocol ButtonStyleable {
    
    var cornerRadius: CGFloat { get }
    
    var borderColor: CGColor { get }
    
    var borderWidth: CGFloat { get }
    
    var backgroundColor: UIColor { get }
}
