//
//  OnboardingViewController.swift
//  perifaAPP
//
//  Created by Thallis Sousa on 14/01/22.
//

//TODO: - Alterar as imagens com copywright free

import UIKit

class OnboardingViewController: UIViewController {
    
    var imagens: [UIImage] = [
        UIImage(named: "Onboarding1.png")!,
        UIImage(named: "Onboarding2.png")!,
        UIImage(named: "Onboarding3.png")!,
        UIImage(named: "Onboarding4.png")!,
        UIImage(named: "Onboarding5.png")!,
        UIImage(named: "Onboarding6.png")!,
        UIImage(named: "Onboarding7.png")!
    ]
    
    let descricoes = ["Seja bem vindo(a) ao SPerifa, o primeiro app de lazer com foco nas periferias!",
                      "Somos um aplicativo focado em reunir locais de lazer nas quebradas de toda a cidade de São Paulo, buscando mostrar que a periferia também é local de lazer e diversão para os nossos."]
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var botaoProximo: UIButton!
    
    //MARK: Mudar o texto do botão conforme passa de tela
    var currentPage = 0 {
        didSet {
            if currentPage == descricoes.count - 1
            {
                botaoProximo.setTitle("Vamos começar", for: .normal)
            } else {
                botaoProximo.setTitle("Próximo", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    //MARK: Quando o botão for clicado
    @IBAction func BotaoProximoClicado(_ sender: UIButton) {
        if currentPage == descricoes.count - 1 {
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

//MARK: Delegates e DataSource do Onboarding
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //Quantas páginas eu quero == número de páginas referente ao Array de descrições == 2
        
        return descricoes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        
        //Toda vez que a célula for iniciada, ela irá setar uma descrição e um array de imagens
        cell.setupImagens(imagens)
        cell.setup(descricoes[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    //MARK: Verifica se houve passagem horizontal da tela do onboarding
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
