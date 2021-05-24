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
    var videoUrls = [String]()
    var sermonVideosArray = [SermonModel]()
    
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
                if urlString == Constants.playListEndpoint {
                    if let safeData = data {
                        
                        if let ids = self.getVideoIDs(safeData) {
                            
                            SermonsDataManger.instance.videoIds = ids
                            for int in 0..<SermonsDataManger.instance.videoIds.count {
                                SermonsDataManger.instance.videoUrls.append("youtube.com/watch?v=\(SermonsDataManger.instance.videoIds[int])")
                            }
                            completionHandler()
                            
                            
                        }
                    }
                }
                 else {
                    if let safeData = data {
                        if let sermons = self.parseVideoData(safeData) {
                            SermonsDataManger.instance.sermonVideosArray = sermons
                            completionHandler()
                        }
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
        
        //Parse JSON
        
        do {
            let playlistModel = try decoder.decode(PlaylistDataModel.self, from: playListData)
            
            for int in 0..<playlistModel.items.count {
                videoIDArray.append(playlistModel.items[int].contentDetails.videoId)
                
            }
            
            
        } catch  {
            print(error)
        }
        
        
        return videoIDArray
    }
    
    func parseVideoData(_ videoData: Data) -> [SermonModel]? {
        let decoder = JSONDecoder()
        var sermonsArray = [SermonModel]()
        
        do {
            let videoModel = try decoder.decode(VideoDataModel.self, from: videoData)
            
            for int in 0..<videoModel.items.count {
                let title = videoModel.items[int].snippet.title
                let thumbnail = videoModel.items[int].snippet.thumbnails.standard.url
                let url = Constants.youtubeUrl + (videoModel.items[int].id)
                let model = SermonModel(title: title, thumbnail: thumbnail, url: url)
                sermonsArray.append(model)
            }
        } catch  {
            print(error)
        }
        print(sermonsArray)
        return sermonsArray
        
    }
}
    
        
  
    //put all video ids in an array
    
   
   
    //retreive video info using videoIDs from playlistURL using videoURL
   
    


