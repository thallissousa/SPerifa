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
    
    static var locaisAPI: [Local] = []
  
    
    /// Responsável por definir a imagem da detail
    static var imagemWeb: UIImage = UIImage(named: "linkImagem") ?? UIImage()
    
    /* MARK: - Delegate (Collection) */
    
    /// Funcção responsável por falar quantas células a collection vai ter
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DiscoverViewController.locaisAPI.count
        
    }
    
    
    /// Funcção pra definir as informações da célula
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "postCell", for: indexPath) as! PostCell
        
        let linkImagem = DiscoverViewController.locaisAPI[indexPath.row].imagem ?? ""
        
        DispatchQueue.main.async {
            cell.imagens.downloaded(from: linkImagem, contentMode: .scaleAspectFill)
            cell.pTitle.text = DiscoverViewController.locaisAPI[indexPath.row].titulo
            cell.pAdress.text =  DiscoverViewController.locaisAPI[indexPath.row].localizacao
        }
       
        return cell
    }
    
    
    /// Função responsável por quando clica em uma célula (abre a nova controller)
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "detail") as?
            DetailViewController {
            
            print("Exitem \(DiscoverViewController.locaisAPI.count) locais na lista da API.\n\nTentando passar \(DiscoverViewController.locaisAPI[indexPath.row])")
            
            let linkImagem = DiscoverViewController.locaisAPI[indexPath.row].imagem ?? ""
            
            vc.setInfos(infos: DiscoverViewController.locaisAPI[indexPath.row])
            vc.imageDetail = linkImagem
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    /* MARK: - Ciclo de Vida */
    
    public override func viewWillAppear(_ animated: Bool) -> Void {
        // Fazendo a chamada da API
        
    }
    
    public override func viewDidLoad() -> Void{
        super.viewDidLoad()
        
        
        // DispatchQueue.main.async {
        
        let group = DispatchGroup()
        group.enter()
        
        self.apiManeger.getLocais() { result in
            defer {group.leave()}
            
            switch result {
            case .success(let locaisDaAPi):
                
                DiscoverViewController.locaisAPI = locaisDaAPi
                
                // Entra aqui quando da certo!
                print("\n\nForam achados: \(locaisDaAPi.count) locais\n\n")
                
                // Caso aconteça qualquer erro com a api, aqui eh onde vai ser lidado!!!
            case .failure(let error):
                print("\n\nErro desenvolvedor: \(error.description)")
                print("Erro Usuário: \(error.localizedDescription)\n\n")
            }
        }
        
        group.notify(queue: .main) {
            self.discoverCollectionView.reloadData()
            
            self.pageConfigs()
            
        }
    }
    
    
    
    /* MARK: - Outros */
    
    func pageConfigs() {
        view.backgroundColor = .systemGray6
        self.title = "Descubra".localized()

        
        //MARK: configuração da navigationBar quando Scrollada
        navigationController?.navigationBar.tintColor = UIColor(named: "OrangeApp")
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .systemGray6
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(named: "OrangeApp") as Any]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "OrangeApp") as Any]
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationItem.rightBarButtonItem = UIBarButtonItem(
                                                           image: UIImage(systemName: "plus.circle.fill"),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(self.initForm)
                                                           )
        
    }
    
    @objc private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func initForm() {
        let formsVC = FormsPageViewController()
        let newNavVC = UINavigationController(rootViewController: formsVC)
        newNavVC.modalPresentationStyle = .fullScreen
        
        present(newNavVC, animated: true)
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
