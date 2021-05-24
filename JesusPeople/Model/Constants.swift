//
//  Constants.swift
//  JesusPeople
//
//  Created by Desiree on 5/23/21.
//

import Foundation

struct Constants {
    static let api = "AIzaSyBALl3j6ofr3CR0QQD6xAiI45zU2riAatM"
    static let channelId = "UCDzdO9eXlpKUxP3FI5q-T8Q"
    static let playlistId = "UUDzdO9eXlpKUxP3FI5q-T8Q"
    static let exampleVideoId = "3EUs1Y4ZHPc"
    
    static let playListEndpoint =  "https://www.googleapis.com/youtube/v3/playlistItems?part=contentDetails&playlistId=UUDzdO9eXlpKUxP3FI5q-T8Q&key=AIzaSyBALl3j6ofr3CR0QQD6xAiI45zU2riAatM&maxResults=15"
    
    static let videoEndpoint =  "https://www.googleapis.com/youtube/v3/videos?part=snippet,liveStreamingDetails&key=AIzaSyBALl3j6ofr3CR0QQD6xAiI45zU2riAatM"
    
    static let youtubeUrl = "youtube.com/watch?v="
}
