//
//  PresentationViewController.swift
//  perifaAPP
//
//  Created by Thallis Sousa on 19/07/21.
//

import UIKit

class PresentationViewController: UIViewController {

    @IBOutlet weak var presentationText: UILabel!
    
    @IBOutlet weak var beginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        //atributos do botão
        beginButton.backgroundColor = .systemOrange
        beginButton.layer.borderWidth = CGFloat(20)
        beginButton.layer.cornerRadius = 15
        beginButton.setTitleColor(.systemBackground, for: .normal)
        beginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        //atributos do texto
        presentationText.textColor = .systemBackground
        presentationText.font = .systemFont(ofSize: 25)
        presentationText.adjustsFontForContentSizeCategory = true
   
        
        view.backgroundColor = .systemOrange

}
}
