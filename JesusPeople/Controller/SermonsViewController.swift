//
//  SermonsViewController.swift
//  JesusPeople
//
//  Created by Desiree on 6/3/21.
//

import UIKit

class SermonsViewController: UITableViewController, UICollectionViewDataSource, UICollectionViewDelegate  {
  
    
    let videoIds = [String]()
    var index = 0
   
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 250.0
       
        SermonsDataManger.instance.performRequest(with: Constants.playListEndpoint, completionHandler: { [self] in
            let endpoint = createVideoEndpoint()
          
            SermonsDataManger.instance.performRequest(with: endpoint, completionHandler: {
                
                DispatchQueue.main.async {
                    tableView.reloadData()
                   
                }
               
            })

        })
       
}

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SermonCell", for: indexPath) as! SermonCell
        
        // Configure the cell...
        
       
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
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? SermonCell else { return }

        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        SermonsDataManger.instance.sermonVideosArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SermonCollectionViewCell
        
        // Configure the cell...
        cell.configureCell(for: indexPath.row)
        index = indexPath.row
        
        return cell
    }
   
    

}
