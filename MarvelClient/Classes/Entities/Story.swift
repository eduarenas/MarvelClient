//
//  Story.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation
import SwiftyJSON

struct Story: Entity {
  
  init(json: JSON) {
    
  }
}

struct StorySummary: EntitySummary {
  
  let resourceURI: String
  let name: String
  let type: String
  
  init(json: JSON) {
    self.resourceURI = json["resourceURI"].string!
    self.name = json["name"].string!
    self.type = json["type"].string!
  }
}
