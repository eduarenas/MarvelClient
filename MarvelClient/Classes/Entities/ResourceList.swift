//
//  ResourceList.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation
import SwiftyJSON

struct ResourceList: JSONSerializable {
  
  let available: Int
  let returned: Int
  let collectionURI: String
  
  init(json: JSON) {
    self.available = json["available"].int!
    self.returned = json["returned"].int!
    self.collectionURI = json["collectionURI"].string!
  }
}
