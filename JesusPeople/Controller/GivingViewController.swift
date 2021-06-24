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
     
        if let url = URL(string: Constants.givingURL), UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url)
            }
    }
    //find a way to go back to welcome view controller when user presses back
    override func viewDidAppear(_ animated: Bool) {
        self.dismiss(animated: true, completion: nil)
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
