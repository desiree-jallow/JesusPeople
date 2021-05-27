//
//  SocialTableViewController.swift
//  JesusPeople
//
//  Created by Desiree on 5/27/21.
//

import UIKit

class SocialTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

 
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let socialVC = segue.destination as! SocialViewController
        if segue.identifier == Constants.facebookSegue {
            
            socialVC.url = "https://www.facebook.com/JesusPeopleChapel"
        } else if segue.identifier == Constants.instagramSegue {
            socialVC.url = "https://www.instagram.com/jesus_people_chapel/"
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
