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
   
    let channelId = "UCDzdO9eXlpKUxP3FI5q-T8Q"
    let playlistId = "UUDzdO9eXlpKUxP3FI5q-T8Q"
    let exampleVideoId = "3EUs1Y4ZHPc"
    
    let playListUrl = URL(string: "https://www.googleapis.com/youtube/v3/playlistItems?part=contentDetails&playlistId=UUDzdO9eXlpKUxP3FI5q-T8Q&key=AIzaSyBALl3j6ofr3CR0QQD6xAiI45zU2riAatM")
    
    let videoUrl = URL(string:  "https://www.googleapis.com/youtube/v3/videos?part=snippet,liveStreamingDetails&id=3EUs1Y4ZHPc&key=AIzaSyBALl3j6ofr3CR0QQD6xAiI45zU2riAatM")
    
   //put all video ids in an array
    //search for all the video ids
   
    
}
