//
//  VideoPlayerViewController.swift
//  JesusPeople
//
//  Created by Desiree on 6/3/21.
//

import UIKit
import youtube_ios_player_helper

class VideoPlayerViewController: UIViewController {
    
    @IBOutlet weak var playerView: YTPlayerView!
    
        var videoId = ""
        var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerView.load(withVideoId: videoId)
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.topItem?.title = tabBarController?.tabBar.selectedItem?.title
    }
}
