//
//  SocialViewController.swift
//  JesusPeople
//
//  Created by Desiree on 5/27/21.
//

import UIKit
import WebKit

class SocialViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var url = ""
    
    override func viewWillAppear(_ animated: Bool) {
        spinner.startAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        
        
            if let url = URL(string: url) {
                webView.load(URLRequest(url: url))
                webView.allowsBackForwardNavigationGestures = true
        // Do any additional setup after loading the view.
    }
        
}
        
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if !webView.isLoading {
            spinner.stopAnimating()
            spinner.hidesWhenStopped = true
        }
    }
}
