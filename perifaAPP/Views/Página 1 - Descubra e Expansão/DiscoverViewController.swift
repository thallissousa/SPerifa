//
//  DiscoverViewController.swift
//  perifaAPP
//
//  Created by Thallis Sousa on 19/07/21.
//



import UIKit

class DiscoverViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    /* MARK: - Atributos */
    
    @IBOutlet var discoverCollectionView: UICollectionView!
    
    private let apiManeger = ApiManeger()
    
    private var locaisAPI: [Local] = []
    
    // Imagens
    
    let imagemDosEstabelecimentos = [
        //8. Galeria de arte urbana
        "galeriadearteurbana",
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
    
        //saraus urbanos
        "sarausuburbanos",
        //9. Ateliê azu
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
        "pombasurbanas",
        //SpCine
        "circuitospcinetiradentes",
        //Arte César Salvi
        "antoniosalvi",
        //Arca de Noé
        "arcaDeNoe",
        //Biblioteca da Unas
        "bibUnas",
        //Espaço Cultural Grande Otelo
        "ECOtelopng",
        //Sarau na Quebrada
        "saraunaQuebrada",
        //Skate Bela Vista
        "SkateBelaVista",
        //Arte de Rua
        "arteDeRua"
    ]
    
    // Títulos dos estabelcimentos
    let titles = [
        //8. Galeria de arte urbana
        "Favela Galeria - Galeria de Arte Urbana",
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
        
        //sarau urbanos
        "Sarau Urbanos",
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
        //SPcine
        "Circuito SP Cine - Cidade Tiradentes",
        //Antonio Salvi
        "Escola de Artes César Antônio Salvi",
        //Teatro Arca de Noé
        "Teatro Arca de Noé",
        //Biblioteca de Unas
        "Biblioteca Comunitária Heliópolis",
        //Espaço Cultural Grande Otelo
        "Espaço Cultural Grande Otelo",
        //Sarau na Quebrada
        "Ponto de Cultura Sarau na Quebrada",
        //Skate Bela Vista
        "Pista de Skate Bela Vista",
        //Arte de rua
        "Arte de Rua - Barro Branco II"
    ]
    
    // Endereço dos estabelecimentos
    let endereco = [
        //8. Galeria de arte urbana
        "Rua Archângelo Archiná, 587 - São Mateus",
        
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
        
        //1. saraus urbanos
        "Avenida Inácio Monteiro, 6900. CEP: 08490-000. Térreo da Biblioteca",
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
        "Av. dos Metalúrgicos, 2100 - Cidade Tiradentes",
        //0. SpCine
        "Avenida Inácio Monteiro, 6900. CEP: 08490-000",
        //Antonio Salvi
        "Rua Tenente Avelar Pires de Azevedo, 360",
        //Teatro Arca de Noé
        "Avenida Visconde Nova Granada, 513",
        //Biblioteca de Unas
        "R. da Mina Central, 372 - Vila Heliopolis",
        //Espaço Cultural Grande Otelo
        "Rua Dimitri Sensaud de Lavaud, 100 – Vila Campesina",
        //Sarau na Quebrada
        "R. Galiléia, 131 - Jardim Santo André, Santo André",
        //Skate Bela Vista
        "R. Ciro dos Anjos, 181",
        //Arte de Rua
        "Rua Eduardo Reuter 155 - 167 Cidade Tiradentes, Barro Branco II"
    ]
    
    
    
    /* MARK: - Delegate (Collection) */
    
    /// Funcção responsável por falar quantas células a collection vai ter
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.endereco.count
        // return self.locaisAPI.count
    }
    
    
    /// Funcção pra definir as informações da célula
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "postCell", for: indexPath) as! PostCell
        cell.imagens.image = UIImage(named: imagemDosEstabelecimentos[indexPath.row])
        cell.pTitle.text = titles[indexPath.row]
        cell.pAdress.text = endereco[indexPath.row]
        return cell
    }
    
    
    /// Funcção responsável por quando clica em uma célula (abre a nova controller)
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
    
    
    
    /* MARK: - Ciclo de Vida */
    
    public override func viewWillAppear(_ animated: Bool) -> Void {
        // Fazendo a chamada da API
        self.apiManeger.getLocais() { result in
            switch result {
            case .success(let locaisDaAPi):
                
                self.locaisAPI = locaisDaAPi
                // Entra aqui quando da certo!
                print("\n\nForam achados: \(locaisDaAPi.count) locais\n\n")

            case .failure(let error):
                print("\n\nErro: \(error.description)\n\n")
            }
        }
    }
    
    
    public override func viewDidLoad() -> Void{
        super.viewDidLoad()
        pageConfigs()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.systemBackground
    }
    
    
    
    /* MARK: - Outros */
    
   
    func pageConfigs() {
        view.backgroundColor = .systemGray6
        title = "Descubra"
        
        //MARK: configuração da navigationBar quando Scrollada
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
    @IBOutlet weak var pAdress: UILabel!
    
    override func awakeFromNib() {
        background.layer.cornerRadius = 8
        imagens.layer.cornerRadius = 8
        
    }
}



//FIXME: Olhar a utilidade desta extension

extension UIApplication {
    
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}

class Core {
  static let shared = Core()
    
    func isNewUser() -> Bool {
        return UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    func isNotNewUser() {
        UserDefaults.standard.set(true, forKey: "isNewUser")
        
    }
    
}
