//
//  mapsViewController.swift
//  perifaAPP
//
//  Created by Thallis Sousa on 19/07/21.
//

import UIKit
import MapKit
import CoreLocation


class MapsViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet var mapView: MKMapView!
    
    //MARK: - "let" propriedades do mapa - classe utilizada para identificar que iremos utilizar a localização do usuário
    let locationManager = CLLocationManager()
    
    var lugarCollection: CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        mapView.mapType = .standard
        view.backgroundColor = .systemGray6
        
//        self.addLocalizacoes()
        self.checkIfLocationIsAvailable()
        
    }
    
    
    func checkIfLocationIsAvailable() {
        //MARK: - função para notificar ao usuário que precisaremos utilizar a localização para acesso aos conteúdos do mapa
        
        DispatchQueue.main.async { [self] in
            self.mapView.showsUserLocation = true
            self.locationManager.delegate = self
            self.locationManager.requestWhenInUseAuthorization()
            self.locationManager.startUpdatingLocation()
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
//            self.mapView.userTrackingMode = .none
            self.addLocalizacoes()
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let region = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
        }
    
    
    func addLocalizacoes() {
        //MARK: - cria o pin com a localização atual do usuário, dando o título de "Você está aqui" para identificar o local atual.
        
        guard let coordenadasUsuario = locationManager.location?.coordinate else {
            return
        }
        
        let pin = self.createPin(name: "Voce está aqui!", subtitle: "", coordinate: coordenadasUsuario)
        
        self.addPointOnMap(pin: pin)
        
        /// Coordenadas dos locais com o zoom
        if let coordenadas = self.lugarCollection {
            self.setZoomMap(place: coordenadas, radius: 1000)
            self.lugarCollection = nil
        } else {
            self.setZoomMap(place: coordenadasUsuario, radius: 1000)
        }
        
        // Adicionando os lugares recebidops da API
        
        for place in DiscoverViewController.locaisAPI {
            
            let pin = self.createPin(
                name: place.titulo!,
                subtitle: place.localizacao!,
                coordinate: CLLocationCoordinate2D(
                    latitude: Double(place.latitude!),
                    longitude: Double(place.longitude!)
                )
            )
            self.addPointOnMap(pin: pin)
        }
    }
    
    
    func mostrarLugarDaCollection(lat: Double, lon: Double) -> Void {
        let coords = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        
        self.lugarCollection = coords
        
        print("Infos recebidas: \(lat) e \(lon)")
    }
    
    /* MARK: - Pins */
    
    /// Adicionar ponto no mapa
    public func addPointOnMap(pin: MKPointAnnotation) -> Void {
        self.mapView.addAnnotation(pin)
    }
    
    /// Cria um pin
    public func createPin(name: String, subtitle: String, coordinate: CLLocationCoordinate2D) ->
    MKPointAnnotation {
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        pin.title = name
        pin.subtitle = subtitle
        
        return pin
    }
    
    /* MARK: - Gerenciamento do Mapa */
    /// Define a região que o mapa vai mostrar
    public func setZoomMap(place: CLLocationCoordinate2D, radius: CLLocationDistance) -> Void {
        // let radiusDistance = CLLocationDistance(exactly: radius)!
        let region = MKCoordinateRegion(center: place, latitudinalMeters: radius, longitudinalMeters: radius)
        
        self.mapView.setRegion(region, animated: true)
    }
    
    //MARK: - Como conectar o mapa com a localização e fazer as rotas
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let latitude = view.annotation?.coordinate.latitude ?? 0
        let longitude = view.annotation?.coordinate.longitude ?? 0
        
        //3 opções de mapa, sendo o primeiro o Apple Maps, o segundo o Google Maps e o terceiro o Waze.
        let appleURL = "http://maps.apple.com/?daddr=\(latitude),\(longitude)"
        let googleURL = "comgooglemaps://?daddr=\(latitude),\(longitude)&directionsmode=driving"
        let wazeURL = "waze://?ll=\(latitude),\(longitude)&navigate=false"
        
        let googleItem = ("Google Maps", URL(string:googleURL)!)
        let wazeItem = ("Waze", URL(string:wazeURL)!)
        var installedNavigationApps = [("Apple Maps", URL(string:appleURL)!)]
        
        if UIApplication.shared.canOpenURL(googleItem.1) {
            installedNavigationApps.append(googleItem)
        }
        
        if UIApplication.shared.canOpenURL(wazeItem.1) {
            installedNavigationApps.append(wazeItem)
        }
        //Identifica qual mensagem irá aparecer ao subir o alerta
        let alert = UIAlertController(title: "Como chegar", message: "Selecione um aplicativo para traçar a rota.", preferredStyle: .actionSheet)
        for app in installedNavigationApps {
            let button = UIAlertAction(title: app.0, style: .default, handler: { _ in
                UIApplication.shared.open(app.1, options: [:], completionHandler: nil)
            })
            alert.addAction(button)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
}

