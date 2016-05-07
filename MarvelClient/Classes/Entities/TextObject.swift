//
//  TextObject.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation
import SwiftyJSON

public struct TextObject: JSONSerializable {
  
  public let type: String
  public let language: String
  public let text: String
  
  public init(json: JSON) {
    self.type = json["type"].string!
    self.language = json["language"].string!
    self.text = json["text"].string!
  }
}

