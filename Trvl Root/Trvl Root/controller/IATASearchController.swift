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

class IATASearchController: UIViewController, UITextFieldDelegate, MKMapViewDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var iataCodeField: UITextField!
    
    var airportAPI = AirportAPI()
    
    var manager: CLLocationManager?
    
    var regionRadius: CLLocationDistance = 1000
    
    let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "launchScreenIcon")!, iconInitialSize: CGSize(width: 80, height: 80), backgroundColor: UIColor.white)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = CLLocationManager()
        manager?.delegate = self
        manager?.desiredAccuracy = kCLLocationAccuracyBest
        
        checkLocationAuthStatus()
        
        mapView.delegate = self
        
        centerMapOnUserLocation()
        
        self.view.addSubview(revealingSplashView)
        revealingSplashView.animationType = SplashAnimationType.heartBeat
        revealingSplashView.startAnimation()
        revealingSplashView.heartAttack = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = "Destination"
    }
    
    func checkLocationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedAlways {
            manager?.startUpdatingLocation()
        } else {
            manager?.requestAlwaysAuthorization()
        }
    }
    
    func centerMapOnUserLocation() {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(mapView.userLocation.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        iataCodeField.resignFirstResponder()
        return true
    }
    
    @IBAction func centerMapPressed(_ sender: UIButton) {
        centerMapOnUserLocation()
    }
    
    
    @IBAction func backgroundTapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func searchAirportPressed(_ sender: UIButton) {
        if let destination = iataCodeField.text {
            airportAPI.retrieveAirport(destination)
            
//            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//            let airportsController = storyboard.instantiateViewController(withIdentifier: "AirportsController") as? AirportsController
//            present(airportsController!, animated: true, completion: nil)
        }
    }
}

extension IATASearchController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            mapView.showsUserLocation = true
            mapView.userTrackingMode = .follow
        }
    }
}
