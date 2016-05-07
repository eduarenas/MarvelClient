//
//  Character.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation
import SwiftyJSON

public struct Character: JSONSerializable {
  
  let id: Int
  let name: String
  let description: String
  let modified: NSDate
  let resourceURI: String
  let urls: [Url]
  
  init(json: JSON) {
    self.id = json["id"].int!
    self.name = json["name"].string!
    self.description = json["name"].string!
    self.modified = json["modified"].date!
    self.resourceURI = json["resourceURI"].string!
    self.urls = json["urls"].array!.map { Url(json: $0) }
  }
}

public struct CharacterSummary: JSONSerializable {
  
  init(json: JSON) {
    
  }
}
