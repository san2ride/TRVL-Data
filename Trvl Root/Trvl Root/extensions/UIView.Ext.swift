//
//  UIView.Ext.swift
//  Trvl Root
//
//  Created by Jason Sanchez on 7/26/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//

import UIKit

extension UIView {
    func fadeTo(alphaValue: CGFloat, withDuration duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            self.alpha = alphaValue
        }
    }
}
