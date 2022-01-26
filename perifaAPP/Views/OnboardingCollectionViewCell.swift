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
    
    func setup(_ descricao: String) {
        //A label do meu slide será o texto contido em "descrição"
        slideLabel.text = descricao
    }
    
    func setupImagens(_ imagens: [UIImage]) {
        //Passando o que será feito com as imagens - criando a animação
        slideImageView.animationImages = imagens
        slideImageView.animationDuration = 14
        slideImageView.animationRepeatCount = 0
        slideImageView.image = imagens.first
        slideImageView.startAnimating()
        slideImageView.contentMode = .scaleToFill
        
        
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
