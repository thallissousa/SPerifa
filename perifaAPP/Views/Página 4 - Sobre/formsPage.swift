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
    let url = URL(string: "https://airtable.com/shrDNCA20OJJzp8NU")! 
        let request = URLRequest(url: url)
        webView.load(request)
        
    }
}


