//
//  BibleViewController.swift
//  JesusPeople
//
//  Created by Desiree on 5/20/21.
//

import UIKit
import WebKit

class BibleViewController: WebViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
      
            if let url = URL(string: Constants.bibleUrl) {
                webView.load(URLRequest(url: url))
                webView.allowsBackForwardNavigationGestures = true
            
        }
        
    }

}
