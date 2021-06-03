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
