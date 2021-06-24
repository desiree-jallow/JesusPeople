//
//  WebViewController.swift
//  JesusPeople
//
//  Created by Desiree on 6/1/21.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    var spinner = UIActivityIndicatorView(style: .large)
    
    override func loadView() {
        super.loadView()
        webView = WKWebView()
        view = webView
        showSpinner()

    }
    
    func showSpinner() {
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        webView.navigationDelegate = self
            if let url = URL(string: Constants.bibleUrl) {
                webView.load(URLRequest(url: url))
                webView.allowsBackForwardNavigationGestures = true
        }
       
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if webView.isLoading {
            showSpinner()
        } else {
            spinner.stopAnimating()
        }
        
    }

}
