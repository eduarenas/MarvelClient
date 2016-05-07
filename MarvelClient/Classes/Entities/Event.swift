//
//  Event.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation
import SwiftyJSON

struct Event: Entity {
 
  init(json: JSON) {
    
  }
}

struct EventSummary: EntitySummary {
  
  let resourceURI: String
  let name: String
  
  init(json: JSON) {
    self.resourceURI = json["resourceURI"].string!
    self.name = json["name"].string!
  }
}
