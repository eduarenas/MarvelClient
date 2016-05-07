//
//  Character.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation
import SwiftyJSON

class Character: JSONSerializable {
  
  let id: Int?
  let name: String?
  let description: String?
  let modified: NSDate?
  
  required init(json: JSON) {
    self.id = json["id"].int
    self.name = json["name"].string
    self.description = json["name"].string
    self.modified = json["modified"].date
  }
}
