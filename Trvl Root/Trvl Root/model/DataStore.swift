//
//  DataStore.swift
//  Trvl Root
//
//  Created by Jason Sanchez on 7/20/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//

import UIKit

class DataStore: NSObject {
    static let instance = DataStore()
    
    var iataArray = [Airport]()
}
