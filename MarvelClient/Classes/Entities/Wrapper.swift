//
//  Wrapper.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation
import SwiftyJSON

public struct Wrapper<T: Entity>: JSONSerializable {
  
  public let code: Int
  public let status: String
  public let data: Container<T>
  public let etag: String
  public let copyright: String
  public let attributionText: String
  public let attributionHTML: String
  
  public init(json: JSON) {
    self.code = json["code"].int!
    self.status = json["status"].string!
    self.data = Container<T>(json: json["data"])
    self.etag = json["etag"].string!
    self.copyright = json["copyright"].string!
    self.attributionText = json["attributionText"].string!
    self.attributionHTML = json["attributionHTML"].string!
  }
}
