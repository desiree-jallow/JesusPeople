//
//  VideoViewController.swift
//  JesusPeople
//
//  Created by Desiree on 5/27/21.
//

import UIKit
import WebKit

class VideoViewController: UIViewController {
    @IBOutlet var webPlayerView: UIView!
    
    var index = 0
        
    var webPlayer: WKWebView!
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let webConfiguration = WKWebViewConfiguration()
                webConfiguration.allowsInlineMediaPlayback = true
        

        // Do any additional setup after loading the view.
        
        DispatchQueue.main.async { [self] in
            self.webPlayer = WKWebView(frame: self.webPlayerView.frame, configuration: webConfiguration)
                    self.webPlayerView.addSubview(self.webPlayer)
            guard let videoURL = URL(string: "https://www.youtube.com/embed/\(SermonsDataManger.instance.videoIds[index])?playsinline=1") else { return }
                    let request = URLRequest(url: videoURL)
                    self.webPlayer.load(request)
                }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
     
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
