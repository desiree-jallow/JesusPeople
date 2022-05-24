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
    var index = 0
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = tabBarController?.tabBar.selectedItem?.title
        
        spinner.startAnimating()
        
        SermonsDataManger.instance.performRequest(with: Constants.playListEndpoint, completionHandler: { [self] in
            let endpoint = createVideoEndpoint()
            
            SermonsDataManger.instance.performRequest(with: endpoint, completionHandler: {
                
                DispatchQueue.main.async  {
                    self.tableView.reloadData()
                    self.spinner.stopAnimating()
                }
                
            })
            
        })
        
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SermonsDataManger.instance.sermonVideosArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.sermonCell, for: indexPath) as! SermonTableViewCell
        
        // Configure the cell...
        cell.configureCell(for: indexPath.row)
        index = indexPath.row
        
        
        return cell
    }
    
    
    func createVideoEndpoint() -> String {
        let urlString = Constants.videoEndpoint
        let separator = "&id="
        let ids = SermonsDataManger.instance.videoIds.joined(separator: ",")
        return urlString + separator + ids
        
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPathForSelectedRow
        if segue.identifier == Constants.videoSegue {
            let videoVC = segue.destination as! VideoPlayerViewController
            if let index = indexPath?.row {
                videoVC.index = index
                videoVC.videoId = SermonsDataManger.instance.videoIds[index]
            }
            
        }
        
    }
    
}
