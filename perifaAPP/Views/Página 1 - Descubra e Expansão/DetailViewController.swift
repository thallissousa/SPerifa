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
    @IBOutlet weak var descricaoDoLocal: UILabel!
    @IBOutlet weak var tLocalizacao: UILabel!
    @IBOutlet weak var comoChegar: UILabel!
    
    var detail = 0
    
    public var informacoes: Local!
    
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 400)

    lazy var ScrollView: UIScrollView = {
    let view = UIScrollView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
    }()

    lazy var ContentView: UIView = {
    let contentView = UIView(frame: .zero)
    contentView.translatesAutoresizingMaskIntoConstraints = false
    return contentView
    }()
    
    
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
        self.descricaoDoLocal.numberOfLines = 0
        
        self.imagemDoLocal.image = UIImage(named: DiscoverViewController.imagemPadrao)
        
        configureViews()
        addViewsConstraints()
    }
    
    func configureViews() {
        view.addSubview(ScrollView)
        view.addSubview(imagemDoLocal)
        ScrollView.addSubview(ContentView)
        ContentView.addSubview(nomeDoEstabelecimento)
        ContentView.addSubview(descricaoDoLocal)
        ContentView.addSubview(tLocalizacao)
        ContentView.addSubview(comoChegar)
    }
    
    func addViewsConstraints(){
        NSLayoutConstraint.activate([
            ScrollView.topAnchor.constraint(equalTo: imagemDoLocal.bottomAnchor),
            ScrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            ScrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            ScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ScrollView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            ContentView.topAnchor.constraint(equalTo: ScrollView.topAnchor),
            ContentView.leadingAnchor.constraint(equalTo: ScrollView.leadingAnchor),
            ContentView.trailingAnchor.constraint(equalTo: ScrollView.trailingAnchor),
            ContentView.bottomAnchor.constraint(equalTo: ScrollView.bottomAnchor),
            ContentView.widthAnchor.constraint(equalTo: ScrollView.widthAnchor)
        ])
        
        nomeDoEstabelecimento.translatesAutoresizingMaskIntoConstraints = false
        descricaoDoLocal.translatesAutoresizingMaskIntoConstraints = false
        tLocalizacao.translatesAutoresizingMaskIntoConstraints = false
        comoChegar.translatesAutoresizingMaskIntoConstraints = false
  //      imagemDoLocal.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nomeDoEstabelecimento.topAnchor.constraint(equalTo: ContentView.topAnchor, constant: 10),
            nomeDoEstabelecimento.leadingAnchor.constraint(equalTo: ContentView.leadingAnchor, constant: 20),
            nomeDoEstabelecimento.trailingAnchor.constraint(equalTo: ContentView.trailingAnchor, constant: -20),
//            nomeDoEstabelecimento.bottomAnchor.constraint(equalTo: nomeDoEstabelecimento.bottomAnchor),
            
            descricaoDoLocal.topAnchor.constraint(equalTo: nomeDoEstabelecimento.bottomAnchor, constant: 8),
            descricaoDoLocal.leadingAnchor.constraint(equalTo: ContentView.leadingAnchor, constant: 20),
            descricaoDoLocal.trailingAnchor.constraint(equalTo: ContentView.trailingAnchor,constant: -20),


            tLocalizacao.topAnchor.constraint(equalTo: descricaoDoLocal.bottomAnchor, constant: 8),
            tLocalizacao.leadingAnchor.constraint(equalTo: ContentView.leadingAnchor, constant: 20),
            tLocalizacao.trailingAnchor.constraint(equalTo: ContentView.trailingAnchor, constant: -20),

            comoChegar.topAnchor.constraint(equalTo: tLocalizacao.bottomAnchor, constant: 8),
            comoChegar.leadingAnchor.constraint(equalTo: ContentView.leadingAnchor, constant: 20),
            comoChegar.trailingAnchor.constraint(equalTo: ContentView.trailingAnchor, constant: -20),
            comoChegar.bottomAnchor.constraint(equalTo: ContentView.bottomAnchor),
            
            imagemDoLocal.topAnchor.constraint(equalTo: view.topAnchor),
            imagemDoLocal.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imagemDoLocal.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imagemDoLocal.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
    }
    
    
    
    /* MARK: - Encapsulamento */
    
    public func setInfos(infos: Local) -> Void {
        self.informacoes = infos
    }
    

    /* MARK: - Ações de Botões */
    
    @IBAction func bGoToAdress(_ sender: Any) {
        
    }
    
    
    
    @IBAction func shareAction(_ sender: Any) {
        let vc = UIActivityViewController(activityItems: ["Olha o local que encontrei no SPerifa!", self.informacoes?.titulo ?? "Nome do local", self.informacoes?.localizacao ?? "Localizacao", "Baixe o App no link: https://apps.apple.com/br/app/sperifa/id1579177301"], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
}
