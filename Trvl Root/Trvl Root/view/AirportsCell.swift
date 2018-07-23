//
//  AirportsCell.swift
//  Trvl Root
//
//  Created by Jason Sanchez on 7/20/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//

import UIKit

class AirportsCell: UITableViewCell {
    
    @IBOutlet weak var airportNameLabel: UILabel!
    @IBOutlet weak var airportIataLabel: UILabel!
    
    internal func configureCell(airport: Airport) {
        airportNameLabel.text = airport.name
        airportIataLabel.text = airport.iata
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    

}
