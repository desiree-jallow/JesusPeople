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
    let snippet:VideoSnippet
}
struct VideoSnippet:Codable {
    let title:String
    let thumbnails:[String:ThumbnailsValue]
    let liveBroadcastContent:String
}

struct ThumbnailsValue:Codable {
    let url:String
}
