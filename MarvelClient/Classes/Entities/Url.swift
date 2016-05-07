//
//  Url.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation
import SwiftyJSON

struct Url: JSONSerializable {
  
  let type: String
  let url: String
  
  init(json: JSON) {
    self.type = json["url"].string!
    self.url = json["url"].string!
  }
}
