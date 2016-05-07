//
//  Event.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation
import SwiftyJSON

public struct Event: Entity {
 
  public let id: Int
  public let modified: NSDate
  public let resourceURI: String
  public let thumbnail: Image
  
  public init(json: JSON) {
    self.id = json["id"].int!
    self.modified = json["modified"].dateTime!
    self.resourceURI = json["resourceURI"].string!
    self.thumbnail = Image(json: json["thumbnail"])
  }
}

public struct EventSummary: EntitySummary {
  
  public let resourceURI: String
  public let name: String
  
  public init(json: JSON) {
    self.resourceURI = json["resourceURI"].string!
    self.name = json["name"].string!
  }
}
