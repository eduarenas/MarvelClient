//
//  Image.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation
import SwiftyJSON

struct Image: JSONSerializable {
  
  let path: String
  let imageExtension: String
  
  init(json: JSON) {
    self.path = json["path"].string!
    self.imageExtension = json["extension"].string!
  }
}
