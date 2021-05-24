//
//  SermonsDataModel.swift
//  JesusPeople
//
//  Created by Desiree on 5/23/21.
//

import Foundation

    struct SermonModel {
        let title:String
        let thumbnail:String
}

    struct PlaylistDataModel:Codable {
        let kind:String
        let etag:String
        let nextPageToken:String
        let items:[PlaylistItem]
        let pageInfo:Info
}

    struct Info:Codable {
        let totalResults:Int
        let resultsPerPage:Int
}

    struct PlaylistItem:Codable {
        let kind:String
        let etag:String
        let id:String
        let contentDetails:Details
     
}
    struct Details:Codable {
        let videoId:String
        let note:String
        let videoPublishedAt:String
}

struct VideoDataModel:Codable {
    let kind:String
    let etag:String
    let nextPageToken:String
    let prevPageToken:String
    let items:[VideoItem]
    let pageInfo:Info
}

struct VideoItem:Codable {
    let kind:String
    let etag:String
    let id:String
    let snippet:VideoSnippet
}
    struct VideoSnippet:Codable {
        let publishedAt:String
        let channelID:String
        let title:String
        let description:String
        let thumbnails:[String:ThumbnailsValue]
        let tags:[String]
        let channelTitle:String
        let categoryId:String
        let liveBroadcastContent:String
        let defaultLanguage:String
        let localized:Localized
        let defaultAudioLanguage:String
    }

struct Localized:Codable {
    let title:String
    let description:String
}
    struct ThumbnailsValue:Codable {
        let url:String
        let width:String
        let height:String
          
    }




