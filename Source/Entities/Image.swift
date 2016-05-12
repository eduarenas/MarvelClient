//
//  Image.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation
import SwiftyJSON

public struct Image: JSONSerializable {
  
  public let path: String
  public let imageExtension: String
  
  public init(json: JSON) {
    self.path = json["path"].string!
    self.imageExtension = json["extension"].string!
  }
}
