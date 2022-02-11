//
//  OnboardingViewController.swift
//  perifaAPP
//
//  Created by Thallis Sousa on 14/01/22.
//

import UIKit

class OnboardingViewController: UIViewController, UICollectionViewDelegate {
    
    private var dataSource: OnboardingViewControllerDataSource
    private var contentView: OnboardingCollectionViewCell
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var botaoProximo: UIButton!
    
    init() {
        self.contentView = OnboardingCollectionViewCell()
        self.dataSource = OnboardingViewControllerDataSource(descricoes: contentView.descricoes)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: Mudar o texto do botão conforme passa de tela
    var currentPage = 0 {
        didSet {
            if currentPage == contentView.descricoes.count - 1
            {
                botaoProximo.setTitle("Vamos começar", for: .normal)
            } else {
                botaoProximo.setTitle("Próximo", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //        collectionView.delegate = OnboardingViewControllerDataSource
        collectionView.dataSource = dataSource
    }
    
    //MARK: Quando o botão for clicado
    @IBAction func BotaoProximoClicado(_ sender: UIButton) {
        if currentPage == contentView.descricoes.count - 1 {
            let controller = storyboard?.instantiateViewController(identifier: "homeTBC") as! UITabBarController
            
            //Como a tela irá abrir e o tipo de animação que irá executar
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .crossDissolve
            
            //MARK: definindo se o usuário já entrou ou não no aplicativo com UserDefaults
            UserDefaults.standard.isOnboarding = true
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}
