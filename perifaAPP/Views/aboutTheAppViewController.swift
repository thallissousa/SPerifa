//
//  aboutTheAppViewController.swift
//  perifaAPP
//
//  Created by Thallis Sousa on 19/07/21.
//

import UIKit

class aboutTheAppViewController: UIViewController {
    
    @IBOutlet weak var indicacaoDeLocal: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setConstraints()
        configButton()

    
    }
    
    func configButton() {
        //configuração do botão
        indicacaoDeLocal.layer.cornerRadius = 8
        indicacaoDeLocal.backgroundColor = .systemGray3
        indicacaoDeLocal.setTitle("Indicação de local", for: .normal)
        indicacaoDeLocal.setTitleColor(.white, for: .normal)
        self.view.addSubview(indicacaoDeLocal)
    }
    
    
    func setConstraints () {
//        // constraints do botão
//        indicacaoDeLocal.translatesAutoresizingMaskIntoConstraints = false
////        indicacaoDeLocal.frame = CGRect(x: 160, y: 100, width: 500, height: 600)
//        indicacaoDeLocal.heightAnchor.constraint(equalToConstant: 45).isActive = true
//        indicacaoDeLocal.widthAnchor.constraint(equalToConstant: 168).isActive = true
//        indicacaoDeLocal.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        indicacaoDeLocal.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20).isActive = true
//        indicacaoDeLocal.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
//        indicacaoDeLocal.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    
        indicacaoDeLocal.translatesAutoresizingMaskIntoConstraints = false
        indicacaoDeLocal.heightAnchor.constraint(equalToConstant: 45).isActive = true
        indicacaoDeLocal.widthAnchor.constraint(equalToConstant: 250).isActive = true
        indicacaoDeLocal.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        indicacaoDeLocal.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
    
    }
    
    
    
}
