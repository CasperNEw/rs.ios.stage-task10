//
//  SelfSizingTableView.swift
//  RSSchool_T10
//
//  Created by Дмитрий Константинов on 27.08.2021.
//

import UIKit

class SelfSizingTableView: UITableView {

    // MARK: - Properties
    override var contentSize: CGSize {
        didSet {
			DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
				self.invalidateIntrinsicContentSize()
			}
        }
    }

    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
