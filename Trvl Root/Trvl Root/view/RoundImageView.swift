//
//  RoundImageView.swift
//  Trvl Root
//
//  Created by Jason Sanchez on 7/21/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//

import UIKit

class RoundImageView: UIImageView {
    
    override func awakeFromNib() {
        setupView()
    }

    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
}
