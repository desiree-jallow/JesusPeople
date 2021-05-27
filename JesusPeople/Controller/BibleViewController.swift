//
//  BibleViewController.swift
//  JesusPeople
//
//  Created by Desiree on 5/20/21.
//

import UIKit
import WebKit

class BibleViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    var spinner = UIActivityIndicatorView(style: .large)
    
    override func viewWillAppear(_ animated: Bool) {
        showSpinner()
    }
    
    override func loadView() {
        super.loadView()
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView

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
      
            if let url = URL(string: Constants.bibleUrl) {
                webView.load(URLRequest(url: url))
                webView.allowsBackForwardNavigationGestures = true
            
        }
       
       
        // Do any additional setup after loading the view.
        
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if webView.isLoading {
            return
        }
        spinner.stopAnimating()
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
