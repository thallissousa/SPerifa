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
    
    var imagemDosEstabelecimentos = [""]
    var titles = [""]
    var endereco = [""]
    let descricao = [
        //SPCine
        "O Circuito SPCine é uma iniciativa que busca levar o acesso ao Cinema a diversas regiões de São Paulo. O cinema tem como proposta o acesso a obras audiovisuais independentes ou de grande bilheteria à preço popular. Os ingressos custam R$ 4,00 (inteira) e R$ 2,00 (meia entrada para estudantes e beneficiários).",
                     
                     //sarau suburbanos
                     "O Sarau Suburbano acontece desde 04 de Maio de 2010, é realizado pela Suburbano Convicto Produções, com a apresentação do escritor Alessandro Buzo. Um sarau com DNA periférico, que já revelou vários talentos, local onde nasceu várias parcerias culturais, entre os frequentadores. Conta com uma média de 20 à 40 participações por edição (entre poetas e mcs), o recorde foi a edição de lançamento do CD “Contra Nós Ninguém Será” do Edi Rock, com 58 participações e a segunda maior participação numa edição foi 56 no lançamento do CD “Nó na Orelha” do CRIOLO, pelo Sarau Suburbano já passou grandes nomes da LITERATURA e do HIP HOP, como EDUARDO (ex-Facção), GOG, EMICIDA, RASHID, Marcelino Freire, Ferréz, entre outros e ainda de outros seguimentos, como a jornalista Eliane Brum e a sambista Leci Brandão. **Quando:** 05 de Setembro às 19h.",
                     //cooperifa
                     "Uma das principais iniciativas do movimento cultural e literário das periferias nos últimos anos, com a participação de diversos artistas e escritores do extremo sul de São Paulo.",
                     //danca narrativa
                     "Com participação do grupo de Londres Esprit Concrete, a Coletiva Oyasis - Mulheres bufálo está ministrando oficinas e workshops online e gratuitos sobre movimentação corporal enquanto ferramenta de liberdade de expressão e autoconhecimento. Mais informações: Comunicacao@bienal.org.br",
                 //
        "ooqieyriuqsdfansdfak;dnf",
                     "IOfoiasndfionasdf",
                     "mais uma vez"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bGoToMap)
        
        descricaoDoLocal.text = descricao[detail]
        
        imagemDoLocal.image = UIImage(named: imagemDosEstabelecimentos[detail])
        
        nomeDoEstabelecimento.text = titles[detail]
        
        comoChegar.text = endereco[detail]
        
        
        }
    
    
    
}
