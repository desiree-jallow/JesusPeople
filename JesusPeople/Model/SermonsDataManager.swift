//
//  SermonsDataManager.swift
//  JesusPeople
//
//  Created by Desiree on 5/23/21.
//

import Foundation

struct SermonsDataManger {
    //search quiery to retrieve the 
    
    
    //video quiery
    let videosUrl = URL(string: "https://www.googleapis.com/youtube/v3/videos/key=\(Constants.apiKey)part=videos")
    
    let channelsUrl = URL(string: "https://www.googleapis.com/youtube/v3/channels/key=AIzaSyBALl3j6ofr3CR0QQD6xAiI45zU2riAatM/part=snippet,id/forUsername=")
    
    //first retreive the channelID
    
}
