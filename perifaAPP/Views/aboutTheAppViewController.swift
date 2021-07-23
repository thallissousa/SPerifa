//
//  aboutTheAppViewController.swift
//  perifaAPP
//
//  Created by Thallis Sousa on 19/07/21.
//

import UIKit

class aboutTheAppViewController: UIViewController {

    @IBOutlet weak var indicacaoDeLocal: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray6

        
        indicacaoDeLocal.translatesAutoresizingMaskIntoConstraints = false
        
        indicacaoDeLocal.layer.cornerRadius = 8
        indicacaoDeLocal.backgroundColor = .systemGray4
        indicacaoDeLocal.setTitle("Indicação de local", for: .normal)
        indicacaoDeLocal.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        indicacaoDeLocal.setTitleColor(.white, for: .normal)
        
        
        
        

        
        view.addSubview(indicacaoDeLocal)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
