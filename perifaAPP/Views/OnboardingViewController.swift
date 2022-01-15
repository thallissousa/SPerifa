//
//  OnboardingViewController.swift
//  perifaAPP
//
//  Created by Thallis Sousa on 14/01/22.
//

//TODO: - Fazer a validação se a pessoa já entrou no aplicativo para não aparecer a onboarding mais uma vez;
//TODO: - Verificar se será possível fazer passar várias imagens (gif).


import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var botaoProximo: UIButton!
    
    var slides: [OnboardingSlide] = []
    
    //MARK: Mudar o texto do botão conforme passa de tela
    var currentPage = 0 {
        didSet {
            if currentPage == slides.count - 1
            {
                botaoProximo.setTitle("Vamos começar", for: .normal)
            } else {
                botaoProximo.setTitle("Próximo", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Define o texto e as imagens da onboarding (definidas na view de "OnboardingSlide")
        slides = [
            OnboardingSlide(descricao: "Seja bem vindo(a) ao SPerifa, o primeiro app de lazer com foco nas periferias!", imagem: UIImage(named: "Onboarding1.png")),
            OnboardingSlide(descricao: "Somos um aplicativo focado em reunir locais de lazer nas quebradas de toda a cidade de São Paulo, buscando mostrar que a periferia também é local de lazer e diversão para os nossos.", imagem: UIImage(named: "Onboarding2.png"))
        ]
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    //MARK: Quando o botão for clicado
    @IBAction func BotaoProximoClicado(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(identifier: "homeTBC") as! UITabBarController
            
            //Como a tela irá abrir e o tipo de animação que irá executar
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .crossDissolve
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
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        
        cell.setup(slides[indexPath.row])
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
