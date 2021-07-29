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
    
    public let adaptativeColor = UIColor(named: "aColor")

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setConstraints()
        configButton()
        configTexto()
        
        navigationController?.navigationBar.barTintColor = .systemOrange
        navigationController?.navigationBar.tintColor = .white


        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Sobre"
        navigationController?.isToolbarHidden = true
        
        
        let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = .systemOrange
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
//        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemBackground]
        
    }
    
    func configButton() {
        //configuração do botão
        indicacaoDeLocal.layer.cornerRadius = 8
        indicacaoDeLocal.backgroundColor = .white
        indicacaoDeLocal.setTitle("Indicação de locais", for: .normal)
        indicacaoDeLocal.tintColor = .black
        self.view.addSubview(indicacaoDeLocal)


    }
    
    func configTexto() {
//        sobreNos.layer.cornerRadius = 8
        sobreNos.textColor = UIColor(named: "adaptativeColor")
        
        
        self.view.addSubview(sobreNos)
    }
    
    
    func setConstraints () {
        //constraints do texto do botão
        indicacaoDeLocal.translatesAutoresizingMaskIntoConstraints = false
        
        let indicacaoDeLocal: [NSLayoutConstraint] = [
            indicacaoDeLocal.heightAnchor.constraint(equalToConstant: 45),
            indicacaoDeLocal.widthAnchor.constraint(equalToConstant: 250),
            indicacaoDeLocal.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicacaoDeLocal.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            
        ]
        
        NSLayoutConstraint.activate(indicacaoDeLocal)
        
    }
    
    
}
