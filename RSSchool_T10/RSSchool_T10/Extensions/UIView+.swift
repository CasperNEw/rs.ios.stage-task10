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
        static let bottomInset: CGFloat = 65
        static let topInset: CGFloat = 12
        static let space: CGFloat = 25
		static let defaultHeight: CGFloat = 60

    }
}
