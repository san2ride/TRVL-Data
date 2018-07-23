//
//  AirportsController.swift
//  Trvl Root
//
//  Created by Jason Sanchez on 7/21/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//

import UIKit

class AirportsController: UITableViewController {
    
    var airportsArray = [Airport]()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Airports"
        
        airportsArray = DataStore.instance.iataArray
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return airportsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let airport = airportsArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AirportsCell
        
        cell.configureCell(airport: airport)
        
        return cell
    }
}
