//
//  UILabel+.swift
//  RSSchool_T10
//
//  Created by Дмитрий Константинов on 26.08.2021.
//

import UIKit

extension UILabel {

    convenience init(text: String,
                     font: UIFont?,
                     textColor: UIColor,
                     numberOfLines: Int = 1,
                     textAlignment: NSTextAlignment = .center) {
        self.init()

        self.text = text
        self.textColor = textColor
        self.font = font
        self.adjustsFontSizeToFitWidth = true
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
    }
}
