//
//  NotesModel.swift
//  JesusPeople
//
//  Created by Desiree on 5/26/21.
//

import UIKit

class NotesModel: NSObject, UIActivityItemSource {
    
    let title:String
    let note:String
    
    init(title:String, note:String) {
        self.title = title
        self.note = note
    }
    
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        self.note
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        self.note
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, subjectForActivityType activityType: UIActivity.ActivityType?) -> String {
       return self.title
    }
    
}
