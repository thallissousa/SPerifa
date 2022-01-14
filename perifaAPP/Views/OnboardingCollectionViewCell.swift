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
    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = slide.imagem
        slideLabel.text = slide.descricao
    }
}
