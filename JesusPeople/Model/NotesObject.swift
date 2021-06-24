//
//  NotesObject.swift
//  JesusPeople
//
//  Created by Desiree on 6/24/21.
//

import Foundation
import RealmSwift

class Note: Object {
    @objc dynamic var title = ""
    @objc dynamic var body = ""
    @objc dynamic var date = Date()
}
