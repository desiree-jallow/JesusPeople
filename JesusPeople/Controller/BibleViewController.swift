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
       
       
        // Do any additional setup after loading the view.
        
        
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
