//
//  Url.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation
import SwiftyJSON

public struct Url: JSONSerializable {
  
  public let type: String
  public let url: String
  
  public init(json: JSON) {
    self.type = json["type"].string!
    self.url = json["url"].string!
  }
}
