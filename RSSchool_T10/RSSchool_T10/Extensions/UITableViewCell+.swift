//
//  UITableViewCell+.swift
//  RSSchool_T10
//
//  Created by Дмитрий Константинов on 27.08.2021.
//

import UIKit

extension UITableViewCell {

    enum Constants {

        static let space: CGFloat = 16
        static let iconSide: CGFloat = 25
    }

    var reorderControlImageView: UIImageView? {
        let reorderControl = self.subviews.first { view -> Bool in
            view.classForCoder.description() == "UITableViewCellReorderControl"
        }
        return reorderControl?.subviews.first { view -> Bool in
            view is UIImageView
        } as? UIImageView
    }

}
