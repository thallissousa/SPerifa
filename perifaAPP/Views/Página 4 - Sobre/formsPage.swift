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
    //MARK: criando uma webView com um link específico para o formulário.
        webView.navigationDelegate = self
    let url = URL(string: "https://airtable.com/shrNcdK2QIlQRujyT")!
        let request = URLRequest(url: url)
        webView.load(request)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Voltar",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(dismissSelf))
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "OrangeApp")
        
    }
    
    @objc private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
    
}


