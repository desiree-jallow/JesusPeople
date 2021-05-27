//
//  BishopViewController.swift
//  JesusPeople
//
//  Created by Desiree on 5/27/21.
//

import UIKit
import WebKit

class BishopViewController: UIViewController,WKNavigationDelegate {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewWillAppear(_ animated: Bool) {
        spinner.startAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        
        
            if let url = URL(string: Constants.bishopUrl) {
                webView.load(URLRequest(url: url))
                webView.allowsBackForwardNavigationGestures = true
            // Do any additional setup after loading the view.
            
        }
     
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
