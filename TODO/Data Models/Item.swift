//
//  Item.swift
//  TODO
//
//  Created by Brandan McDevitt on 04/06/2018.
//  Copyright © 2018 Brandan McDevitt. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    @objc dynamic var dateCreated : Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
