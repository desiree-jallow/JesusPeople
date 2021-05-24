//
//  SermonsDataManager.swift
//  JesusPeople
//
//  Created by Desiree on 5/23/21.
//

import Foundation

struct SermonsDataManger {
    static var instance = SermonsDataManger()
    //retrieve the videoIDs with playlistURL
    var videoIds = [String]()
    
    func performRequest(with urlString: String, completionHandler: @escaping () -> Void) {
        
        //Create a url
        if let url = URL(string: urlString) {
            //create url session
            let session = URLSession.shared
            //give session a task
            
            let task =  session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    return
                }
                //parse data
                if let safeData = data {
                    
                    if let ids = self.getVideoIDs(safeData) {
                        
                        SermonsDataManger.instance.videoIds = ids
                        completionHandler()
                        
                        
                    }
                }
                
            }
            task.resume()
        }
    }
    
    //parse data and set up weather model
    func getVideoIDs(_ playListData: Data) -> [String]? {
        let decoder = JSONDecoder()
        var videoIDArray:[String] = []
        do {
            //Parse JSON
            
            do {
                let playlistModel = try decoder.decode(PlaylistDataModel.self, from: playListData)
                
                for int in 0..<playlistModel.items.count {
                    videoIDArray.append(playlistModel.items[int].contentDetails.videoId)
                   
                }
                
                
            } catch  {
                print(error)
            }
            
        }
        return videoIDArray
    }
}
    
        
  
    //put all video ids in an array
    
   
   
    //retreive video info using videoIDs from playlistURL using videoURL
   
    


