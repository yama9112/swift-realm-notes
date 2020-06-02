//
//  Note.swift
//  Notes
//
//  Created by user1 on 2020/05/31.
//  Copyright © 2020 yama9112. All rights reserved.
//

import Foundation
import RealmSwift

class Note: Object {
    @objc dynamic var uuid = NSUUID().uuidString
    @objc dynamic var title = ""
    @objc dynamic var contents = ""
    @objc dynamic var updateAt = Date()
    
    override class func primaryKey() -> String? {
        return "uuid"
    }
}
