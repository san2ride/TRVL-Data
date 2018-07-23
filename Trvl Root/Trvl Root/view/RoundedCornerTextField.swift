//
//  RoundedCornerTextField.swift
//  Trvl Root
//
//  Created by Jason Sanchez on 7/21/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//

import UIKit

class RoundedCornerTextField: UITextField {
    
    //var textRectOffSet: CGFloat = 3.5
    
    override func awakeFromNib() {
        setupView()
    }
    func setupView() {
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
