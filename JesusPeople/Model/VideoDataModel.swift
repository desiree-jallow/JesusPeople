//
//  VideoDataModel.swift
//  JesusPeople
//
//  Created by Desiree on 5/24/21.
//

import Foundation

struct VideoDataModel:Codable {
    let items:[VideoItem]
}

struct VideoItem:Codable {
    let id:String
    let snippet:VideoSnippet
}
struct VideoSnippet:Codable {
    let title:String
    let publishedAt:String
    let thumbnails:Thumbnails
    let liveBroadcastContent:String
}

struct Thumbnails:Codable {
    let image:Default
    
    enum CodingKeys:String,CodingKey {
        case image = "default"
    }
}

struct Default:Codable {
    let url:String
}


