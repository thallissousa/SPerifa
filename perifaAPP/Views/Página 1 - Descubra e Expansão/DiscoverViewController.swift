//
//  DiscoverViewController.swift
//  perifaAPP
//
//  Created by Thallis Sousa on 19/07/21.
//

import UIKit

class DiscoverViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var discoverCollectionView: UICollectionView!
    let imagemDosEstabelecimentos = [
        //SpCine
        "circuitospcinetiradentes",
        //saraus urbanos
        
        "sarausuburbanos",
        //cooperifa
        
        "cooperifa",
        //danca narrativa
        "dancanarrativa",
        //bike-a-thon
        "bikeathon",
        //Fábrica de Cultura Cidade Tiradentes
        "fabricadeculturatiradentes",
        //casa de cultura hip hop
        "casaculturahiphop",
        //Casa de cultura são mateus
        "casaculturasaomateus",
        //8. Galeria de arte urbana
        "galeriadearteurbana",
        //9. Atêlie azu
        "atelieazul",
        //10. Horta Comunitária Damata
        "grupodamata",
        //11.Okupacao cultural
        "okupacaocultural",
        //12. Casa Cultural Raul Seixas
        "casaraulseixas",
        //13. Slam da Guilhermina
        "slamdaguilhermina",
        //14. Obra Social Dom Bosco
        "obrasocialdombosco",
        //15. Casa Ecoativa
        "casaecoativa",
        //16. Centro Cultural Arte em Construção
        "pombasurbanas"
    ]
    
    
    let titles = [
        //SPcine
        "Circuito SP Cine - Cidade Tiradentes",
        //sarau urbanos
        "Sarau Urbanos",
        //cooperifa
        "Cooperifa",
        //danca narrativa
        "Escola de Dança Narrativa",
        //bike-a-tho
        "Bike-a-Thon",
        //Fábrica de Cultura Cidade Tiradentes
        "Fábrica de Cultura Cidade Tiradentes",
        //
        "Casa de Cultura Hip Hop Leste",
        //Casa de cultura são mateus
        "Casa de Cultura de São Mateus",
        //8. Galeria de arte urbana
        "Favela Galeria - Galeria de Arte Urbana",
        //9.  Atelie Azu
        "Atêlie Azu",
        //10.Horta Comunitária do Grupo Damata
        "Horta Comunitária do Grupo Damata",
        //11. Okupação Cultural Coragem
        "Okupação Cultural Coragem",
        //12. Casa Cultural Raul Seixas
        "Casa Cultural Raul Seixas",
        //13. Slam da Guilhermina
        "Slam da Guilhermina",
        //14.Obra Social Dom Bosco
        "Obra Social Dom Bosco",
        //15. Casa Ecoativa
        "Casa Ecoativa",
        //16. Centro Cultural Arte em Construção
        "Centro Cultural Arte em Construção",
    ]
    
    
    let endereco = [
        //0. SpCine
        "Avenida Inácio Monteiro, 6900. CEP: 08490-000",
        //1. saraus urbanos
        "Avenida Inácio Monteiro, 6900. CEP: 08490-000. Térreo da Biblioteca",
        //2. cooperifa
        "Bar do Zé Batidão - Rua Bartolomeu do Santos, 797 - Jardim Guaruja",
        //3. danca narrativa
        "Cidade Tiradentes. Online.",
        
        //4. Bike-a-thon
        "Cidade Tiradentes",
        //5. Fábrica de Cultura Cidade Tiradentes
        "Rua Henriqueta Noguez Brieba, 281 - Conj. Hab. Fazenda do Carmo - Cidade Tiradentes",
        //6. Casa de cultura hip hop
        "Rua Sarah Kubitscheck, 165 - Cidade Tiradentes",
        //7. Casa de cultura de São Mateus
        "Rua José Francisco dos Santos, 502 - São Mateus",
        //8. Galeria de arte urbana
        "Rua Archângelo Archiná, 587 - São Mateus",
        //9.  Atelie Azu
        "Rua Cinturão Verde, 333 - Ermelino Matarazzo",
        //10.Horta Comunitária do Grupo Damata
        "Rua Major Vitorino de Souza Rocha, s/n, perto da CPTM José Bonifácio",
        //11. Okupação Cultural Coragem
        "R. Vicente Avelar, 53 - Conj. Res. José Bonifácio - Itaquera",
        //12. Casa Cultural Raul Seixas
        "Rua Murmúrios da tarde, 211 - Itaquera",
        //13. Slam da Guilhermina
        "Metrô Vila Guilhermina-Esperança",
        //14.Obra Social Dom Bosco
        "Rua Álvaro Mendonça, 456 - Itaquera",
        //15. Casa Ecoativa
        "Ilha do Bororé, Margens da Represa Billings -  Zona Sul",
        //16. Centro cultural Pombas Urbanas
        "Av. dos Metalúrgicos, 2100 - Cidade Tiradentes"
        
    ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagemDosEstabelecimentos.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "postCell", for: indexPath) as! PostCell
        cell.imagens.image = UIImage(named: imagemDosEstabelecimentos[indexPath.row])
        cell.pTitle.text = titles[indexPath.row]
        cell.pAuthor.text = endereco[indexPath.row]
        return cell
        
    }
    
    //passar os conteúdos entre as páginas
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "detail") as?
            DetailViewController {
            vc.imagemDosEstabelecimentos = imagemDosEstabelecimentos
            vc.titles = titles
            vc.endereco = endereco
            vc.detail = indexPath.item
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageConfigs()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.systemBackground
        
    }
    
    
    func pageConfigs() {
        view.backgroundColor = .systemGray6
        
        title = "Descubra"
        
        //configuração da navigationBar quando Scrollada
        navigationController?.navigationBar.tintColor = .white
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = .systemOrange
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
}


class PostCell: UICollectionViewCell {
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var imagens: UIImageView!
    @IBOutlet weak var pTitle: UILabel!
    @IBOutlet weak var pAuthor: UILabel!
    
    
    override func awakeFromNib() {
        background.layer.cornerRadius = 8
        imagens.layer.cornerRadius = 8
        
    }
    
    
}

extension UIApplication {
    
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}
