//
//  OnboardingViewControllerDelegate.swift
//  perifaAPP
//
//  Created by Thallis Sousa on 11/02/22.
//

import Foundation
import UIKit

class OnboardingViewControllerDataSource: NSObject, UICollectionViewDataSource {
    
    let data = [String]
    
    init(descricoes: [String]) {
        self.data = descricoes
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //Quantas páginas eu quero == número de páginas referente ao Array de descrições == 2
        return  descricoes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        
        //Toda vez que a célula for iniciada, ela irá setar uma descrição e um array de imagens
        cell.setupImagens(OnboardingRepository.shared.imagesOnboarding)
        cell.setupConstraints()
        cell.setup(OnboardingRepository.shared.descricoes[indexPath.row])
       
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    //MARK: - Verifica se houve passagem horizontal da tela do onboarding
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
}
