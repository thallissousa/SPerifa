//
//  formsPage.swift
//  perifaAPP
//
//  Created by Thallis Sousa on 28/07/21.
//

import UIKit
import WebKit


class FormsPageViewController: UIViewController, WKNavigationDelegate {
    
    var webView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(webView)
        webView.navigationDelegate = self
    let url = URL(string: "https://airtable.com/shrNcdK2QIlQRujyT")!
        let request = URLRequest(url: url)
        
        DispatchQueue.main.async {
            self.webView.load(request)
        }
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Voltar",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(dismissSelf))
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "OrangeApp")
    }
    
    override func viewDidLayoutSubviews() {
        webView.frame = CGRect(x: view.frame.minX, y: view.frame.minY, width: view.frame.width, height: view.frame.height)
    }

    
    @objc private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }

    
}


