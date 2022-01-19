//
//  UIViewController+Extension.swift
//  perifaAPP
//
//  Created by Thallis Sousa on 15/01/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    static var identifier: String {
        return String(describing: self)
    }
    //MARK: Extensão criada para instanciar o storyboard 
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: identifier) as! Self
    }
}
