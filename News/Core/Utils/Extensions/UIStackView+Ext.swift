//
//  UIStackView+Ext.swift
//  News
//
//  Created by BTS.id on 02/03/26.
//

import UIKit

extension UIStackView {
    func removeAllArrangedSubviews() {
        self.arrangedSubviews.forEach { view in
            self.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
    }
}
