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
        beginButton.backgroundColor = UIColor(named: "OrangeApp")
        beginButton.layer.borderWidth = CGFloat(2)
        beginButton.layer.borderColor = CGColor(gray: 1, alpha: 1)
        beginButton.layer.cornerRadius = 8
        beginButton.setTitleColor(.white, for: .normal)
        
        
        //atributos do texto
        presentationText.textColor = .white
        presentationText.font = .systemFont(ofSize: 25)
        presentationText.adjustsFontForContentSizeCategory = true
        
        
        view.backgroundColor = UIColor(named: "OrangeApp")
        
    }
}
