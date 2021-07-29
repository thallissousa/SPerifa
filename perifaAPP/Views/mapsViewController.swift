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
        view.backgroundColor = .systemGray6
        createPin()
        checkIfLocationIsAvailable()
        
        let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = .systemOrange
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
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
        
        //Adicionando Pins às outras localizações
        let pinCircuitoSP = MKPointAnnotation()
        pinCircuitoSP.coordinate = CLLocationCoordinate2D(latitude: -23.58051187191593, longitude: -46.38965236738707)
        pinCircuitoSP.title = "Circuito SP Cine - Cidade Tiradentes"
        mapView.addAnnotation(pinCircuitoSP)
        _ = MKCoordinateRegion(center: pinCircuitoSP.coordinate, latitudinalMeters: CLLocationDistance(exactly: 100)!, longitudinalMeters: CLLocationDistance(exactly: 100)!)
        mapView.setRegion(region, animated: true)
        
    }
  
}
