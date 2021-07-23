//
//  mapsViewController.swift
//  perifaAPP
//
//  Created by Thallis Sousa on 19/07/21.
//

import UIKit
import MapKit
import CoreLocation


class mapsViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPin()
        checkIfLocationIsAvailable()
        
    }
    
    func checkIfLocationIsAvailable() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func createPin() {
        let pin = MKPointAnnotation()
        guard let latitude = locationManager.location?.coordinate.latitude else {return}
        guard let longitude = locationManager.location?.coordinate.longitude else {return}
        pin.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        pin.title = "Você está aqui!"
        mapView.addAnnotation(pin)
        let region = MKCoordinateRegion(center: pin.coordinate, latitudinalMeters: CLLocationDistance(exactly: 100)!, longitudinalMeters: CLLocationDistance(exactly: 100)!)
        mapView.setRegion(region, animated: true)
        
    }
    
}
