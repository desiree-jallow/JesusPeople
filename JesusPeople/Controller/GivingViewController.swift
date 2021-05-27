//
//  GivingViewController.swift
//  JesusPeople
//
//  Created by Desiree on 5/26/21.
//

import UIKit
import StoreKit

class GivingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
       let vc = SKStoreProductViewController()
        vc.loadProduct(withParameters: [SKStoreProductParameterITunesItemIdentifier:NSNumber(value:1052274581)], completionBlock: nil)

        present(vc, animated: true, completion: nil)
        
        
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
