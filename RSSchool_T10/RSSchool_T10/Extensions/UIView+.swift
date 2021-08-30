//
//  UIView+.swift
//  RSSchool_T10
//
//  Created by Дмитрий Константинов on 26.08.2021.
//

import UIKit

extension UIView {

    func addSubviews(_ views: UIView...) {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }

    enum Constants {

        static let sideInset: CGFloat = 20
		static let sideButton: CGFloat = 30
        static let bottomInset: CGFloat = 65
        static let topInset: CGFloat = 12
		static let space5: CGFloat = 5
		static let space10: CGFloat = 10
		static let space20: CGFloat = 20
        static let space25: CGFloat = 25
		static let space30: CGFloat = 30
		static let space40: CGFloat = 40
		static let space55: CGFloat = 55
		static let space90: CGFloat = 90
		static let defaultHeight: CGFloat = 60

    }
}
