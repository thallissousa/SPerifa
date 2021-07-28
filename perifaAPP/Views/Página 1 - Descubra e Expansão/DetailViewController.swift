//
//  DetailViewController.swift
//  perifaAPP
//
//  Created by Thallis Sousa on 19/07/21.
//

import Foundation
import UIKit

class DetailViewController: UIViewController{
       
    @IBOutlet weak var imagemDoLocal: UIImageView!
    @IBOutlet weak var nomeDoEstabelecimento: UILabel!
    @IBOutlet weak var tSobre: UILabel!
    @IBOutlet weak var descricaoDoLocal: UITextView!
    @IBOutlet weak var tLocalizacao: UILabel!
    @IBOutlet weak var comoChegar: UILabel!
    @IBOutlet weak var bGoToMap: UIButton!
    
    
    var detail = 0
    
    var imagemDosEstabelecimentos = ["iffiiffififi"]
    var titles = [""]
    var endereco = [""]
    let descricao = ["testeste testes test etsstsetest s", "fkjasndfkjna", "zoobmomoasdmf", "ofoasdifoasdfioan", "ooqieyriuqsdfansdfak;dnf", "IOfoiasndfionasdf", "mais uma vez"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bGoToMap)
        
        descricaoDoLocal.text = descricao[detail]
        
        imagemDoLocal.image = UIImage(named: imagemDosEstabelecimentos[detail])
        
        nomeDoEstabelecimento.text = titles[detail]
        
        tLocalizacao.text = endereco[detail]
        
        
        }
    
    
    
}
