//
//  MapsViewController.swift
//  InovationMaps
//
//  Created by Cassia Franco on 29/10/20.
//  Copyright © 2020 Cassia Franco. All rights reserved.
//

import UIKit
import MapKit

class MapsViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestLocation()
        }

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        mapView.showsUserLocation = true
        locationManager.startUpdatingLocation()
    }
    @IBAction func toppedshowAddress(_ sender: Any) {
    }
}

extension MapsViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        mapView.centerCoordinate = location! .coordinate
        let region = mapView.regionThatFits(MKCoordinateRegion(center: location!.coordinate, latitudinalMeters: 600.0, longitudinalMeters: 600.0))
        mapView.setRegion(region, animated: false)
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
