//
//  SermonsDataModel.swift
//  JesusPeople
//
//  Created by Desiree on 5/23/21.
//

import Foundation


    struct SermonsVideoDataModel:Codable {
        let kind:String
        let etag:String
        let nextPageToken:String
        let prevPageToken:String
        let pageInfo:PageInfo
        let items:[VideoItems]
    }
struct PageInfo:Codable {
    let totalResults:Int
    let resultsPerPage:Int
}
    struct VideoItems:Codable {
        let snippet:VideoSnippet
        let id:String
}

    struct VideoSnippet:Codable {
        let title: String
        let liveBroadcastContent:String
        let thumbnails:[String:ThumbnailsValue]
    }


    struct ThumbnailsValue:Codable {
        let url:String
        let width:String
        let height:String
          
    }


    struct SermonsChannelDataModel:Codable {
        let items:[ChannelItems]
}

    struct ChannelItems:Codable {
        let snippet:ChannelSnippet
        let id:String
}

    struct ChannelSnippet:Codable {
        let title: String
        let thumbnails:[String:ChannelThumbnailsValue]
}


    struct ChannelThumbnailsValue:Codable {
        let url:String
        let width:String
        let height:String
}



