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
    
    var detail = 0
    
    public var informacoes: Local!
    
    
    /* MARK: - Ciclo de Vida */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.destination is MapsViewController else {return}
        
        let vc = segue.destination as? MapsViewController
        vc?.mostrarLugarDaCollection(
            lat: Double(self.informacoes.latitude ?? 0.0),
            lon: Double(self.informacoes.longitude ?? 0.0)
        )
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let noInfo: String = "Sem infromações"
        
        print("\n\nForam recebidos essas infos \(String(describing: self.informacoes))")
        
        print("Título: \(self.informacoes?.titulo ?? noInfo)")
        
        self.nomeDoEstabelecimento.text = self.informacoes?.titulo ?? noInfo
        self.comoChegar.text = self.informacoes?.localizacao ?? noInfo
        
        let descricaoCompleta: String = "\(self.informacoes?.descricao ?? noInfo) \n\nHorário de Funcionamento:\n\(self.informacoes?.horario_funcionamento ?? noInfo) \n\nValores:\n\(self.informacoes?.valor ?? noInfo) \n\nContato:\n\(self.informacoes?.contato ?? noInfo)"
        
        self.descricaoDoLocal.text = descricaoCompleta
        
        self.imagemDoLocal.image = UIImage(named: DiscoverViewController.imagemPadrao)
    }
    
    /* MARK: - Encapsulamento */
    
    public func setInfos(infos: Local) -> Void {
        self.informacoes = infos
    }
    
    /* MARK: - Ações de Botões */
    
    @IBAction func bGoToAdress(_ sender: Any) {
        
    }
}
