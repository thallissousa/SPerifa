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
        
        beginButton.backgroundColor = .systemOrange
        beginButton.layer.cornerRadius = 15
        
        presentationText.textColor = .white
        presentationText.font = .systemFont(ofSize: 25)
        presentationText.adjustsFontForContentSizeCategory = true
   
        view.backgroundColor = .orange

}
}
