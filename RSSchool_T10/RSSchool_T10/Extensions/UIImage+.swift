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

		static let minusOne = UIImage(named: "-1")
		static let plusOne = UIImage(named: "+1")
		static let minusFive = UIImage(named: "-5")
		static let plusFive = UIImage(named: "+5")
		static let minusTen = UIImage(named: "-10")
		static let plusTen = UIImage(named: "+10")

		static let dice = UIImage(named: "icon_Dice")
		static let next = UIImage(named: "icon_next")
		static let next_ = UIImage(named: "icon_next_")
		static let previous = UIImage(named: "icon_previous")
		static let previous_ = UIImage(named: "icon_previous_")

		static let play = UIImage(named: "Play")
		static let pause = UIImage(named: "Pause")
		static let undo = UIImage(named: "Undo")

    }
}
