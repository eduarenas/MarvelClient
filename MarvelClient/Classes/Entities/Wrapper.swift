//
//  Wrapper.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation
import SwiftyJSON

struct Wrapper<T: JSONSerializable>: JSONSerializable {
  let code: Int
  let status: String
  let data: Container<T>
  let etag: String
  let copyright: String
  let attributionText: String
  let attributionHTML: String
  
  init(json: JSON) {
    self.code = json["code"].int!
    self.status = json["status"].string!
    self.data = Container<T>(json: json["data"])
    self.etag = json["etag"].string!
    self.copyright = json["copyright"].string!
    self.attributionText = json["attributionText"].string!
    self.attributionHTML = json["attributionHTML"].string!
  }
}
