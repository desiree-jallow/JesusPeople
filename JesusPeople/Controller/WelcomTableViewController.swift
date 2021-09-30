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
        navigationController?.navigationBar.topItem?.title = tabBarController?.tabBar.selectedItem?.title
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
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let minRowHeight: CGFloat = 100.0
        let tableHeight = tableView.frame.height
        let temp = tableHeight / 5
        return temp > minRowHeight ? temp : minRowHeight
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let givingIndexPath = IndexPath(row: 4, section: 0)
        if indexPath == givingIndexPath {
            if let url = URL(string: Constants.givingURL), UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url)
                }
        }
    }

}
