//
//  SermonsTableViewController.swift
//  JesusPeople
//
//  Created by Desiree on 5/20/21.
//

import UIKit
import GoogleAPIClientForREST


class SermonsTableViewController: UITableViewController  {
    let videoIds = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SermonsDataManger.instance.performRequest(with: Constants.playListEndpoint, completionHandler: { [self] in
            let endpoint = createVideoEndpoint()
            SermonsDataManger.instance.performRequest(with: endpoint, completionHandler: {
                DispatchQueue.main.async {
                    tableView.reloadData()
                }
               
            })
//            print(SermonsDataManger.instance.videoIds)
//            print(SermonsDataManger.instance.videoUrls)

        })
       
}

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return SermonsDataManger.instance.sermonVideosArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sermonCell", for: indexPath) as! SermonTableViewCell
        
        // Configure the cell...
        cell.configureCell(for: indexPath.row)
    
        return cell
    }
    
    func createVideoEndpoint() -> String {
        let urlString = Constants.videoEndpoint
        let separator = "&id="
        let ids = SermonsDataManger.instance.videoIds.joined(separator: ",")
        return urlString + separator + ids
        
    }
    
    
    
    
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


