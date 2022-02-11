//
//  OnboardingCollectionViewCell.swift
//  perifaAPP
//
//  Created by Thallis Sousa on 14/01/22.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideLabel: UILabel!
    @IBOutlet weak var SperifaLogo: UIImageView!

    public let imagesOnboarding: [UIImage] = [
        UIImage(named: "Onboarding1.png")!,
        UIImage(named: "Onboarding2.png")!,
        UIImage(named: "Onboarding3.png")!,
        UIImage(named: "Onboarding4.png")!,
        UIImage(named: "Onboarding5.png")!,
        UIImage(named: "Onboarding6.png")!,
        UIImage(named: "Onboarding7.png")!
    ]
    
    public let descricoes: [String] = [
        "Seja bem vindo(a) ao SPerifa, o primeiro app de lazer com foco nas periferias!",
        "Somos um aplicativo focado em reunir locais de lazer nas quebradas de toda a cidade de São Paulo, buscando mostrar que a periferia também é local de lazer e diversão para os nossos."
    ]
    
    func setup(_ descricao: String) {
        slideLabel.text = descricao
    }
    
    func setupViewBindings(dataSource: UICollectionViewDataSource, collectionViewDelegate: UICollectionViewDelegate) {
        OnboardingCollectionViewCell.dataSource = dataSource
    }
    
    func setupImagens(_ imagens: [UIImage]) {
        //Passando o que será feito com as imagens - criando a animação
        slideImageView.animationImages = imagens
        slideImageView.animationDuration = 14
        slideImageView.animationRepeatCount = 0
        slideImageView.image = imagens.first
        slideImageView.startAnimating()
        slideImageView.contentMode = .scaleToFill
        
         }

    func setupConstraints() {
       SperifaLogo.translatesAutoresizingMaskIntoConstraints = false
        SperifaLogo.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            SperifaLogo.centerXAnchor.constraint(equalTo: slideImageView.centerXAnchor),
            SperifaLogo.topAnchor.constraint(equalTo: slideImageView.topAnchor, constant: 10),
            SperifaLogo.heightAnchor.constraint(equalToConstant: 43.32),
            SperifaLogo.widthAnchor.constraint(equalToConstant: 164)
        ])
    }

}
