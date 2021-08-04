//
//  aboutTheAppViewController.swift
//  perifaAPP
//
//  Created by Thallis Sousa on 19/07/21.
//

import UIKit

class aboutTheAppViewController: UIViewController {
    
    @IBOutlet weak var indicacaoDeLocal: UIButton!
    @IBOutlet weak var sobreNos: UILabel!
    @IBOutlet weak var juntosSomosNos: UILabel!
    @IBOutlet weak var tJuntosSomosNos: UITextView!
    
    public let adaptativeColor = UIColor(named: "aColor")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        configNavBar()
        setConstraints()
        configButton()
        configTexto()
        
    }
    
    func configButton() {
        //MARK: configuração do botão de Indicação de locais
        indicacaoDeLocal.layer.cornerRadius = 8
        indicacaoDeLocal.backgroundColor = .systemOrange
        indicacaoDeLocal.setTitle("Indicação de locais", for: .normal)
        indicacaoDeLocal.tintColor = .white
        self.view.addSubview(indicacaoDeLocal)
        
    }
    //MARK: atributos dos textos na view de "Sobre", com as cores selecionadas.
    func configTexto() {
        sobreNos.textColor = UIColor(named: "adaptativeColor")
        self.view.addSubview(sobreNos)
        
        juntosSomosNos.text = "Juntos, somos nós"
        juntosSomosNos.textColor = .white
        self.view.addSubview(juntosSomosNos)
    }
    
    
    func setConstraints () {
        //MARK: constraints do texto do botão
        indicacaoDeLocal.translatesAutoresizingMaskIntoConstraints = false
        
        let indicacaoDeLocal: [NSLayoutConstraint] = [
            indicacaoDeLocal.heightAnchor.constraint(equalToConstant: 45),
            indicacaoDeLocal.widthAnchor.constraint(equalToConstant: 250),
            indicacaoDeLocal.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicacaoDeLocal.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
        ]
        
        NSLayoutConstraint.activate(indicacaoDeLocal)
        
    }
    
    func configNavBar() {
        //MARK: configurações da navigation e da NavBar
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Sobre"
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = .systemOrange
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
}
