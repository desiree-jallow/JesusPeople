//
//  SermonsDataModel.swift
//  JesusPeople
//
//  Created by Desiree on 5/23/21.
//

import Foundation

//if doesnt work check if any are optional


struct PlaylistDataModel:Codable {
    let items:[PlaylistItem]
    
}

struct PlaylistItem:Codable {
    let contentDetails:Details
    
}
struct Details:Codable {
    let videoId:String    
}






