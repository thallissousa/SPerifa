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
        
        tableView.frame = CGRect(x: 0, y: 25, width: view.frame.size.width, height: (view.frame.size.height) / 3)
        tableView.clipsToBounds = true
        
        var frame = CGRect.zero
        frame.size.height = .leastNormalMagnitude
        tableView.tableHeaderView = UIView(frame: frame)
        
        logoImageView.layer.masksToBounds = true
        logoImageView.contentMode = .scaleToFill
        
        view.addSubview(tableView)
        view.addSubview(logoImageView)
        
        view.backgroundColor = .systemGray6
        
        setupConstraints()
        configNavBar()
    }
    
    func setupConstraints() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.frame.size.height / 6)).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 53).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 164).isActive = true
    }
    
    func configNavBar() {
        //MARK: configurações da navigation e da NavBar
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Sobre"
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .systemGray6
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(named: "OrangeApp") as Any]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "OrangeApp") as Any]
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
    // MARK: Table view
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
        
        tableView.backgroundColor = .systemGray6
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ///clique na celula
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadInputViews()
        
        switch indexPath.row {
        case 0:
            let rootVC = AboutTextViewController()
            let navVC = UINavigationController(rootViewController: rootVC)
            navVC.modalPresentationStyle = .fullScreen
            
            present(navVC, animated: true)
            
        case 1:
            guard let scene = self.view.window?.windowScene else {
                return
            }
            SKStoreReviewController.requestReview(in: scene)
            
        case 2:
            let vc = UIActivityViewController(activityItems: ["Baixe o app SPerifa e encontre locais para rolês na sua quebrada! Link: https://apps.apple.com/br/app/sperifa/id1579177301"], applicationActivities: [])
            vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
            present(vc, animated: true)
            
        case 3:
            let formsVC = FormsPageViewController()
            let newNavVC = UINavigationController(rootViewController: formsVC)
            newNavVC.modalPresentationStyle = .fullScreen
            
            present(newNavVC, animated: true)
            
        case 4:
            let errorVC = ErrorViewController()
            let newNavVC = UINavigationController(rootViewController: errorVC)
            newNavVC.modalPresentationStyle = .fullScreen
            present(newNavVC, animated: true)
            
        default:
            print("tá fazendo é nada boooy")
        }
    }
}

class AboutTextViewController: UIViewController {
    
    let aboutText = ["Olá, seja bem vindo(a) ao SPerifa. O aplicativo criado pela periferia, e para a periferia. O nosso objetivo é reunir locais de lazer nas quebradas de toda a cidade de São Paulo que, geralmente, não são conhecidos. O aplicativo busca reunir, em um só lugar, opções de lazer fora do centro, mostrando que a periferia também é local de lazer e diversão para os nossos.", "Juntos, somos nós", "Para que o aplicativo continue existindo e chegando a mais pessoas, é importante que você faça indicacões de locais de lazer na sua quebrada. A ideia aqui, é criar uma rede que seja alimentada pelos próprios usuários e, somente com a colaboração de todas(os), conseguiremos continuar expandindo nosso ideal e entregando cada vez mais opções de entretenimento nas periferias."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Sobre o SPerifa"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Voltar",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(dismissSelf))

        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "OrangeApp")
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes =  [.foregroundColor: UIColor(named: "OrangeApp") as Any]
        
        let firstLabel = UILabel.init()
        firstLabel.frame = CGRect(x: 0, y: view.frame.minY, width: view.frame.width - 40, height: (view.frame.size.height)/3)
        firstLabel.text = aboutText[0]
        firstLabel.layer.masksToBounds = true
        firstLabel.center = CGPoint(x: view.frame.midX, y: (view.frame.midY)/2)
        firstLabel.textAlignment = .natural
        firstLabel.numberOfLines = 0
        firstLabel.font = UIFont.systemFont(ofSize: 16,weight: .light)
        firstLabel.textColor = UIColor(named: "adaptativeColor")
        
        let secondLabel = UILabel.init()
        secondLabel.frame = CGRect(x: 0, y: view.frame.midY, width: view.frame.width - 20, height: (view.frame.size.height)/4)
        secondLabel.text = aboutText[1]
        secondLabel.layer.masksToBounds = true
        secondLabel.center = CGPoint(x: view.frame.midX, y: view.frame.midY)
        secondLabel.textAlignment = .natural
        secondLabel.textColor = UIColor(named: "OrangeApp")
        secondLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        let thirdLabel = UILabel.init()
        thirdLabel.frame = CGRect(x: 0, y: view.frame.minY, width: view.frame.width - 40, height: (view.frame.size.height)/3)
        thirdLabel.text = aboutText[2]
        thirdLabel.layer.masksToBounds = true
        thirdLabel.center = CGPoint(x: view.frame.midX, y: (view.frame.midY)/2)
        thirdLabel.textAlignment = .natural
        thirdLabel.numberOfLines = 0
        thirdLabel.textColor = UIColor(named: "adaptativeColor")
        thirdLabel.font = UIFont.systemFont(ofSize: 16,weight: .light)

        
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        thirdLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(firstLabel)
        self.view.addSubview(secondLabel)
        self.view.addSubview(thirdLabel)
        
        firstLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 150).isActive = true
        firstLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        firstLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        secondLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor,constant: 30).isActive = true
        secondLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        secondLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20).isActive = true
        
        thirdLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        thirdLabel.topAnchor.constraint(equalTo: secondLabel.bottomAnchor, constant: 10).isActive = true
        thirdLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        thirdLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
    }
    
    @objc private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
    
    
}


