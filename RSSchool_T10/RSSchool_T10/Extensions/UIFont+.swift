//
//  UIFont+.swift
//  RSSchool_T10
//
//  Created by Дмитрий Константинов on 26.08.2021.
//

import UIKit

extension UIFont {

    enum FontStyle: String {
        case regular
        case italic
        case extraLight
        case extraLightItalic
        case light
        case lightItalic
        case semiBold
        case semiBoltItalic
        case bold
        case boldItalic
        case extraBolt = "ExtraBold"
        case extraBoldItalic
        case black
        case blackItalic
    }

    static func nunito(style: FontStyle, size: CGFloat) -> UIFont? {
        return UIFont.init(name: "Nunito-\(style.rawValue)", size: size)
    }
}
