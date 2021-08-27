//
//  UIImage+.swift
//  RSSchool_T10
//
//  Created by Дмитрий Константинов on 27.08.2021.
//

import UIKit

extension UIImageView {

    func tint(color: UIColor) {
        self.image = self.image?.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
    }
}

extension UIImage {

    enum Game {

        static let add = UIImage(named: "icon_add")
        static let button = UIImage(named: "icon_button")
        static let delete = UIImage(named: "icon_delete")
        static let sort = UIImage(named: "icon_sort")

    }
}
