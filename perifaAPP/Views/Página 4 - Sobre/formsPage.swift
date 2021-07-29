//
//  formsPage.swift
//  perifaAPP
//
//  Created by Thallis Sousa on 28/07/21.
//

import UIKit
import WebKit


class FormsPageViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
    let url = URL(string: "https://forms.gle/R7dRqn4q8EnYFGrGA")! 
        let request = URLRequest(url: url)
        webView.load(request)
        
    }
}


