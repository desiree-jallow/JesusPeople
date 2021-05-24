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
    let thumbnails:Thumbnails
    let liveBroadcastContent:String
}

struct Thumbnails:Codable {
    let standard:Standard
}

struct Standard:Codable {
    let url:String
}
