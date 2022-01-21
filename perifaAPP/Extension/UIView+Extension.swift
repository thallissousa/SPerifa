//
//  UIView+Extension.swift
//  perifaAPP
//
//  Created by Thallis Sousa on 14/01/22.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
