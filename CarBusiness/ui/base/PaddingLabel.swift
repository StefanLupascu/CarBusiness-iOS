//
//  PaddingLabel.swift
//  CarBusiness
//
//  Created by Stefan Lupascu on 14.07.2021.
//

import UIKit

final class PaddingLabel: UILabel {
    
    private var paddingTop: CGFloat = 5
    private var paddingBottom: CGFloat = 5
    private var paddingLeft: CGFloat = 15
    private var paddingRight: CGFloat = 15
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: paddingTop, left: paddingLeft, bottom: paddingBottom, right: paddingRight)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + paddingLeft + paddingRight,
                      height: size.height + paddingTop + paddingBottom)
    }
    
    override var bounds: CGRect {
            didSet {
                // ensures this works within stack views if multi-line
                preferredMaxLayoutWidth = bounds.width - (paddingLeft + paddingRight)
            }
        }
}
