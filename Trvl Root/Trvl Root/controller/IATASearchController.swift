//
//  IATASearchController.swift
//  Trvl Root
//
//  Created by Jason Sanchez on 7/20/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import RevealingSplashView

class IATASearchController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var iataCodeField: UITextField!
    
    var airportAPI = AirportAPI()
    
    let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "launchScreenIcon")!, iconInitialSize: CGSize(width: 80, height: 80), backgroundColor: UIColor.white)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(revealingSplashView)
        revealingSplashView.animationType = SplashAnimationType.heartBeat
        revealingSplashView.startAnimation()
        
        revealingSplashView.heartAttack = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = "Destination"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        iataCodeField.resignFirstResponder()
        return true
    }
    
    @IBAction func backgroundTapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func searchAirportPressed(_ sender: UIButton) {
        if let destination = iataCodeField.text {
            airportAPI.retrieveAirport(destination)
        }
    }
}
