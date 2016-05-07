//
//  Series.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation
import SwiftyJSON

struct Series: Entity {
  
  init(json: JSON) {
    
  }
}

struct SeriesSummary: EntitySummary {
  
  let resourceURI: String
  let name: String
  
  init(json: JSON) {
    self.resourceURI = json["resourceURI"].string!
    self.name = json["name"].string!
  }
}
