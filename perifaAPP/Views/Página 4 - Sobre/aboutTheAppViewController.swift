//
//  aboutTheAppViewController.swift
//  perifaAPP
//
//  Created by Thallis Sousa on 19/07/21.

import StoreKit
import UIKit

class aboutTheAppViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var sobreNos: UILabel!
    @IBOutlet weak var juntosSomosNos: UILabel!
    @IBOutlet weak var tJuntosSomosNos: UITextView!
    
    public let adaptativeColor = UIColor(named: "aColor")
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    
    private let cellTitles = ["Sobre o SPerifa",
                              "Avaliar o aplicativo",
                              "Compartilhar aplicativo",
                              "Enviar sugestão de local",
                              "Reportar erro"]
    private let logoImageView = UIImageView(image: UIImage(named: "logo_sperifa"))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.frame = CGRect(x: 10, y: 30, width: (view.frame.size.width) - 20, height: 230)
        tableView.clipsToBounds = true
        tableView.backgroundColor = .white
        self.tableView.layer.cornerRadius = 14.0
        
        var frame = CGRect.zero
        frame.size.height = .leastNormalMagnitude
        tableView.tableHeaderView = UIView(frame: frame)
        
        logoImageView.frame = CGRect(x: 120, y: 500, width: 150, height: 50)
        
        view.addSubview(tableView)
        view.addSubview(logoImageView)
        
        setupConstraints()
        configNavBar()
    }
    
    
    func setupConstraints() {
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        logoImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: (view.frame.midX)/2).isActive = true
        logoImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -((view.frame.midX)/2)).isActive = true
        logoImageView.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 250).isActive = true
                
    }
    
    func configNavBar() {
        //MARK: configurações da navigation e da NavBar
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Sobre"
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "OrangeApp") as Any]
        navBarAppearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        content.text = cellTitles[indexPath.row]
        content.textProperties.color = UIColor(named: "OrangeApp")!
        
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        switch indexPath.row {
        case 0:
            let rootVC = AboutTextViewController()
            let navVC = UINavigationController(rootViewController: rootVC)
            navVC.modalPresentationStyle = .fullScreen
            
            present(navVC, animated: true)
            
        case 1:
            let alert = UIAlertController(title: "Feedback",
                                          message: "Está gostando do aplicativo?",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancelar",
                                          style: .cancel,
                                          handler: nil))
            alert.addAction(UIAlertAction(title: "Sim, estou gostando",
                                          style: .default,
                                          handler: { [self] _ in
                                            guard let scene = self.view.window?.windowScene else {
                                                return
                                                }
                                                SKStoreReviewController.requestReview(in: scene)
                                                }))
            alert.addAction(UIAlertAction(title: "Não muito",
                                          style: .default,
                                          handler: nil))
            
            present(alert, animated: true)
            
        case 2:
            print("clicou na terceira célula")
        case 3:
            performSegue(withIdentifier: "forms", sender: Any?.self)
        case 4:
            print("clicou na quinta célula")
        default:
            print("tá fazendo é nada boooy")
        }
    }
    
}

class AboutTextViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Sobre o SPerifa"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Voltar",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(dismissSelf))
        
//        let aboutFirstText = UITextView(frame: CGRect(x: (view.frame.minX) - 10,
//                                                      y: view.frame.minY,
//                                                      width: (view.frame.width) - 15,
//                                                      height: 30))
//        aboutFirstText.text = "Olá, seja bem vindo(a) ao SPerifa.\n Oaplicativo criado pela periferia, e para a periferia.\n O nosso objetivo é reunir locais de lazer nas quebradas de toda a cidade de São Paulo que, geralmnete, não são conhecidos.\n O aplicativo busca reunir, em um só lugar, opções delazer fora do centro, mostrando que a periferia também é local de lazer e diversão paa os nossos."
        
        let aboutLabel = UILabel()
        aboutLabel.text = "Juntos, somos nós"
        
        let aboutSecondText = UITextView()
        aboutSecondText.text = "Para que o aplicativo continue existindo e chegando a mais pessoas, é importante que você faça indicacões de locais de lazer na sua quebrada.\n A ideia aqui, é criar uma rede que seja alimentada pelos próprios usuários e, somente com a colaboração de todas(os), conseguiremos continuar expandindo nosso ideal e entregando cada vez mais opções de entretenimento nas periferias."

    }
    
    @objc private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
}
