//
//  BishopViewController.swift
//  JesusPeople
//
//  Created by Desiree on 5/27/21.
//

import UIKit
import WebKit

class BishopViewController: WebViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            if let url = URL(string: Constants.bishopUrl) {
                webView.load(URLRequest(url: url))
                webView.allowsBackForwardNavigationGestures = true
            
        }
     
    }

}
