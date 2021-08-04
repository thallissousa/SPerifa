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
    
    //MARK: "let" propriedades do mapa - classe utilizada para identificar que iremos utilizar a localização do usuário
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        view.backgroundColor = .systemGray6
        createPin()
        checkIfLocationIsAvailable()
        
    }
    
    func checkIfLocationIsAvailable() {
        //MARK: função para notificar ao usuário que precisaremos utilizar a localização para acesso aos conteúdos do mapa
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
 
    func createPin() {
        //MARK: cria o pin com a localização atual do usuário, dando o título de "Você está aqui" para identificar o local atual.
        let pin = MKPointAnnotation()
        guard let latitude = locationManager.location?.coordinate.latitude else {return}
        guard let longitude = locationManager.location?.coordinate.longitude else {return}
        pin.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        pin.title = "Você está aqui!"
        mapView.addAnnotation(pin)
        let region = MKCoordinateRegion(center: pin.coordinate, latitudinalMeters: CLLocationDistance(exactly: 100)!, longitudinalMeters: CLLocationDistance(exactly: 100)!)
        mapView.setRegion(region, animated: true)
        
        
        //MARK: Adicionando Pins às outras localizações. Aqui, damos as coordenadas do local (latitude e longitude), um título que aparecerá no mapa e uma distância aproximada do ponto das coordenadas (aprx. 100m).
        //Circuito SP Cine
        let pinCircuitoSP = MKPointAnnotation()
        pinCircuitoSP.coordinate = CLLocationCoordinate2D(latitude: -23.58051187191593, longitude: -46.38965236738707)
        pinCircuitoSP.title = "Circuito SP Cine - Cidade Tiradentes"
        pinCircuitoSP.subtitle =   "Avenida Inácio Monteiro, 6900. CEP: 08490-000"
        mapView.addAnnotation(pinCircuitoSP)
        _ = MKCoordinateRegion(center: pinCircuitoSP.coordinate, latitudinalMeters: CLLocationDistance(exactly: 100)!, longitudinalMeters: CLLocationDistance(exactly: 100)!)
        mapView.setRegion(region, animated: true)
        
        //Sarau Urbano
        let pinSarauUrbano = MKPointAnnotation()
        pinSarauUrbano.coordinate = CLLocationCoordinate2D(latitude: -23.58051187191593, longitude: -46.38965236738707)
        pinSarauUrbano.title = "Sarau Urbano"
        pinSarauUrbano.subtitle = "Avenida Inácio Monteiro, 6900. CEP: 08490-000. Térreo da Biblioteca"
        mapView.addAnnotation(pinSarauUrbano)
        _ = MKCoordinateRegion(center: pinSarauUrbano.coordinate, latitudinalMeters: CLLocationDistance(exactly: 100)!, longitudinalMeters: CLLocationDistance(exactly: 100)!)
        mapView.setRegion(region, animated: true)
        
        //Escola de dança narrativa
        let pinFabricadeCultura = MKPointAnnotation()
        pinFabricadeCultura.coordinate = CLLocationCoordinate2D(latitude: -23.56858460710392, longitude: -46.418339775502844)
        pinFabricadeCultura.title = "Fábrica de Cultura Cidade Tiradentes"
        pinFabricadeCultura.subtitle = "Rua Henriqueta Noguez Brieba, 281 - Conj. Hab. Fazenda do Carmo - Cidade Tiradentes"
        mapView.addAnnotation(pinFabricadeCultura)
        _ = MKCoordinateRegion(center: pinFabricadeCultura.coordinate, latitudinalMeters: CLLocationDistance(exactly: 100)!, longitudinalMeters: CLLocationDistance(exactly: 100)!)
        mapView.setRegion(region, animated: true)
        
        //Casa de Cultura Hip Hop Leste
        let pinCulturaHipHop = MKPointAnnotation()
        pinCulturaHipHop.coordinate = CLLocationCoordinate2D(latitude: -23.582295102560245, longitude: -46.4064252635767)
        pinCulturaHipHop.title = "Casa de Cultura Hip Hop Leste"
        pinCulturaHipHop.subtitle =  "Rua Sarah Kubitscheck, 165 - Cidade Tiradentes"
        mapView.addAnnotation(pinCulturaHipHop)
        _ = MKCoordinateRegion(center: pinCulturaHipHop.coordinate, latitudinalMeters: CLLocationDistance(exactly: 100)!, longitudinalMeters: CLLocationDistance(exactly: 100)!)
        mapView.setRegion(region, animated: true)
        
        //Casa de Cultura Municipal de São Mateus
        let pinCasaCulturaSM = MKPointAnnotation()
        pinCasaCulturaSM.coordinate = CLLocationCoordinate2D(latitude: -23.597237593393668, longitude: -46.48887914427237)
        pinCasaCulturaSM.title = "Casa de Cultura Municipal de São Mateus"
        pinCasaCulturaSM.subtitle = "Rua José Francisco dos Santos, 502 - São Mateus"
        mapView.addAnnotation(pinCasaCulturaSM)
        _ = MKCoordinateRegion(center: pinCasaCulturaSM.coordinate, latitudinalMeters: CLLocationDistance(exactly: 100)!, longitudinalMeters: CLLocationDistance(exactly: 100)!)
        mapView.setRegion(region, animated: true)
        
        //Galeria de Arte Urbana
        let pinCulturaArteUrbana = MKPointAnnotation()
        pinCulturaArteUrbana.coordinate = CLLocationCoordinate2D(latitude: -23.597974482985546, longitude: -46.48067585221265)
        pinCulturaArteUrbana.title = "Galeria de Arte Urbana"
        pinCulturaArteUrbana.subtitle =   "Rua Archângelo Archiná, 587 - São Mateus"
        mapView.addAnnotation(pinCulturaArteUrbana)
        _ = MKCoordinateRegion(center: pinCulturaArteUrbana.coordinate, latitudinalMeters: CLLocationDistance(exactly: 100)!, longitudinalMeters: CLLocationDistance(exactly: 100)!)
        mapView.setRegion(region, animated: true)
        
        //Ateliê Azu
        let pinAtelieAzu = MKPointAnnotation()
        pinAtelieAzu.coordinate = CLLocationCoordinate2D(latitude: -23.49054059947771, longitude: -46.46576462154968)
        pinAtelieAzu.title = "Ateliê Azu"
        pinAtelieAzu.subtitle = "Rua Cinturão Verde, 333 - Ermelino Matarazzo"
        mapView.addAnnotation(pinAtelieAzu)
        _ = MKCoordinateRegion(center: pinAtelieAzu.coordinate, latitudinalMeters: CLLocationDistance(exactly: 100)!, longitudinalMeters: CLLocationDistance(exactly: 100)!)
        mapView.setRegion(region, animated: true)
        
        //Horta Comunitária do Grupo Damata
        let pinHortaComunitariaDamata = MKPointAnnotation()
        pinHortaComunitariaDamata.coordinate = CLLocationCoordinate2D(latitude: -23.535362984559537, longitude: -46.43046646991449)
        pinHortaComunitariaDamata.title = "Horta Comunitária do Grupo Damata"
        pinHortaComunitariaDamata.subtitle = "Rua Major Vitorino de Souza Rocha, s/n, perto da CPTM José Bonifácio"
        mapView.addAnnotation(pinHortaComunitariaDamata)
        _ = MKCoordinateRegion(center: pinHortaComunitariaDamata.coordinate, latitudinalMeters: CLLocationDistance(exactly: 100)!, longitudinalMeters: CLLocationDistance(exactly: 100)!)
        mapView.setRegion(region, animated: true)
        
        //Okupação Cultural Coragem
        let pinOkupacaoCultura = MKPointAnnotation()
        pinOkupacaoCultura.coordinate = CLLocationCoordinate2D(latitude: -23.54489981114258, longitude: -46.43638191359729)
        pinOkupacaoCultura.title = "Okupação Cultural Coragem"
        pinOkupacaoCultura.subtitle =  "R. Vicente Avelar, 53 - Conj. Res. José Bonifácio - Itaquera"
        mapView.addAnnotation(pinOkupacaoCultura)
        _ = MKCoordinateRegion(center: pinOkupacaoCultura.coordinate, latitudinalMeters: CLLocationDistance(exactly: 100)!, longitudinalMeters: CLLocationDistance(exactly: 100)!)
        mapView.setRegion(region, animated: true)
        
        //Casa Cultural Raul Seixas
        let pinCasaRaulSeixas = MKPointAnnotation()
        pinCasaRaulSeixas.coordinate = CLLocationCoordinate2D(latitude: -23.552669693335254, longitude: -46.44298409825247)
        pinCasaRaulSeixas.title = "Casa Cultural Raul Seixas"
        pinCasaRaulSeixas.subtitle =    "Rua Murmúrios da tarde, 211 - Itaquera"
        mapView.addAnnotation(pinCasaRaulSeixas)
        _ = MKCoordinateRegion(center: pinCasaRaulSeixas.coordinate, latitudinalMeters: CLLocationDistance(exactly: 100)!, longitudinalMeters: CLLocationDistance(exactly: 100)!)
        mapView.setRegion(region, animated: true)
        
        //Slam da Guilhermina
        let pinSlamGuilhermina = MKPointAnnotation()
        pinSlamGuilhermina.coordinate = CLLocationCoordinate2D(latitude: -23.529261413458816, longitude: -46.51679799825751)
        pinSlamGuilhermina.title = "Slam da Guilhermina"
        pinSlamGuilhermina.subtitle = "Metrô Vila Guilhermina-Esperança"
        mapView.addAnnotation(pinSlamGuilhermina)
        _ = MKCoordinateRegion(center: pinSlamGuilhermina.coordinate, latitudinalMeters: CLLocationDistance(exactly: 100)!, longitudinalMeters: CLLocationDistance(exactly: 100)!)
        mapView.setRegion(region, animated: true)
        
        
        // Obra Social Dom Bosco
        let pinDomBoscoObra = MKPointAnnotation()
        pinDomBoscoObra.coordinate = CLLocationCoordinate2D(latitude: -23.534628673550394, longitude: -46.44713815222648)
        pinDomBoscoObra.title = "Obra Social Dom Bosco"
        pinDomBoscoObra.subtitle =  "Rua Álvaro Mendonça, 456 - Itaquera"
        mapView.addAnnotation(pinDomBoscoObra)
        _ = MKCoordinateRegion(center: pinDomBoscoObra.coordinate, latitudinalMeters: CLLocationDistance(exactly: 100)!, longitudinalMeters: CLLocationDistance(exactly: 100)!)
        mapView.setRegion(region, animated: true)
        
        //Casa Ecoativa
        let pinCasaEcoativa = MKPointAnnotation()
        pinCasaEcoativa.coordinate = CLLocationCoordinate2D(latitude: -23.769634083255063, longitude: -46.648872835246344)
        pinCasaEcoativa.title = "Casa Ecoativa"
        pinCasaEcoativa.subtitle =  "Ilha do Bororé, Margens da Represa Billings -  Zona Sul"
        mapView.addAnnotation(pinCasaEcoativa)
        _ = MKCoordinateRegion(center: pinCasaEcoativa.coordinate, latitudinalMeters: CLLocationDistance(exactly: 100)!, longitudinalMeters: CLLocationDistance(exactly: 100)!)
        mapView.setRegion(region, animated: true)
        
        // Sarau da Cooperifa
        let pinCooperifa = MKPointAnnotation()
        pinCooperifa.coordinate = CLLocationCoordinate2D(latitude: -23.66892901965522, longitude: -46.74508805219689)
        pinCooperifa.title = "Sarau da Cooperifa"
        pinCooperifa.subtitle =  "Bar do Zé Batidão - Rua Bartolomeu do Santos, 797 - Jardim Guaruja"
        mapView.addAnnotation(pinCooperifa)
        _ = MKCoordinateRegion(center: pinCooperifa.coordinate, latitudinalMeters: CLLocationDistance(exactly: 100)!, longitudinalMeters: CLLocationDistance(exactly: 100)!)
        mapView.setRegion(region, animated: true)
        
        //Centro Cultural Arte em Construção
        let pinCCArteEmConstrucao = MKPointAnnotation()
        pinCCArteEmConstrucao.coordinate = CLLocationCoordinate2D(latitude: -23.598977004332635, longitude: -46.401870398242174)
        pinCCArteEmConstrucao.title = "Centro Cultural Arte em Construção"
        pinCCArteEmConstrucao.subtitle =  "Av. dos Metalúrgicos, 2100 - Cidade Tiradentes"
        mapView.addAnnotation(pinCCArteEmConstrucao)
        _ = MKCoordinateRegion(center: pinCCArteEmConstrucao.coordinate, latitudinalMeters: CLLocationDistance(exactly: 100)!, longitudinalMeters: CLLocationDistance(exactly: 100)!)
        mapView.setRegion(region, animated: true)
        
        //Benjamin - A Padaria (teste)
        let pinBenjamin = MKPointAnnotation()
        pinBenjamin.coordinate = CLLocationCoordinate2D(latitude: -23.626714717168316, longitude: -46.639621714154494)
        pinBenjamin.title = "Benjamin, a Padaria"
        pinBenjamin.subtitle = "Padaria de rico"
        mapView.addAnnotation(pinBenjamin)
        _ = MKCoordinateRegion(center: pinBenjamin.coordinate, latitudinalMeters: CLLocationDistance(exactly: 100)!, longitudinalMeters: CLLocationDistance(exactly: 100)!)
        mapView.setRegion(region, animated: true)
        
    }
    
}

