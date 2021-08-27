//
//  UIViewController+.swift
//  RSSchool_T10
//
//  Created by 19046471 on 30.08.2021.
//

import UIKit

extension UIViewController {

	func setLeftNavigationButton(_ button: UIBarButtonItem) {
		let spacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace,
										  target: nil, action: nil)
		spacer.width = 13;
		navigationItem.leftBarButtonItems = [spacer, button]
	}

	func setRightNavigationButton(_ button: UIBarButtonItem) {
		let spacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace,
										  target: nil, action: nil)
		spacer.width = -13;
		navigationItem.rightBarButtonItems = [spacer, button]
	}
}
