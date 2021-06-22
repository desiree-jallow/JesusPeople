//
//  WelcomTableViewController.swift
//  JesusPeople
//
//  Created by Desiree on 6/21/21.
//

import UIKit

class WelcomTableViewController: UITableViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var churchNameLabel: UILabel!
    
    @IBOutlet weak var contactUsLabel: UILabel!
    
    @IBOutlet weak var ourMinistriesLabel: UILabel!
    
    @IBOutlet weak var bishopsCornerLabel: UILabel!
    
    @IBOutlet weak var givingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.unselectedItemTintColor = .white
        addShadowToLabel(to: welcomeLabel)
        addShadowToLabel(to: churchNameLabel)
        addShadowToLabel(to: contactUsLabel)
        addShadowToLabel(to: ourMinistriesLabel)
        addShadowToLabel(to: bishopsCornerLabel)
        addShadowToLabel(to: givingLabel)
        
      
    }
    func addShadowToLabel(to label: UILabel) {
        label.layer.masksToBounds = false
              label.layer.shadowOffset = CGSize(width: 1, height: 1)
        label.layer.rasterizationScale = UIScreen.main.scale
        label.layer.shadowRadius = 6.0
        label.layer.shadowOpacity = 1.0
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
