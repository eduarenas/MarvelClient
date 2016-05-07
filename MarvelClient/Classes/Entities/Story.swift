//
//  Story.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation
import SwiftyJSON

public struct Story: Entity {
  
  public init(json: JSON) {
    
  }
}

public struct StorySummary: EntitySummary {
  
  public let resourceURI: String
  public let name: String
  public let type: String
  
  public init(json: JSON) {
    self.resourceURI = json["resourceURI"].string!
    self.name = json["name"].string!
    self.type = json["type"].string!
  }
}
