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
                //if endpoint id playlist endpoint parse playlist data
                if urlString == Constants.playListEndpoint {
                    if let safeData = data {
                        
                        if let ids = self.getVideoIDs(safeData) {
                            
                            SermonsDataManger.instance.videoIds = ids
                            //create urls for videos and adds them to videoURLs array
                            for int in 0..<SermonsDataManger.instance.videoIds.count {
                                SermonsDataManger.instance.videoUrls.append("youtube.com/watch?v=\(SermonsDataManger.instance.videoIds[int])")
                            }
                            completionHandler()
                            
                        }
                    }
                }
                 else {
                    if let safeData = data {
                        //if endpoint is video endpoint parse video data
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
    
    //parse data and set up an array that holds the video ids
    func getVideoIDs(_ playListData: Data) -> [String]? {
        let decoder = JSONDecoder()
        var videoIDArray:[String] = []
        
        //Parse JSON
        
        do {
            let playlistModel = try decoder.decode(PlaylistDataModel.self, from: playListData)
            //create videoIDArray
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
            //create sermonModel from data and add to sermonsArray for display in tableview
            for int in 0..<videoModel.items.count {
                let title = videoModel.items[int].snippet.title
                let thumbnail = videoModel.items[int].snippet.thumbnails.image.url
                let url = Constants.youtubeUrl + (videoModel.items[int].id)
                let date = self.formatDate(from: videoModel.items[int].snippet.publishedAt)
                let model = SermonModel(title: title, thumbnail: thumbnail, url: url, date: date)
                sermonsArray.append(model)
            }
        } catch  {
            print(error)
        }
    
        return sermonsArray
        
    }
    
    func formatDate(from string:String) -> String {
        var string = string
        string.removeLast(10)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: string) ?? Date()
        dateFormatter.dateStyle = .long
        return dateFormatter.string(from: date)
    }
}
    
   
    


