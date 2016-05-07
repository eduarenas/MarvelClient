//
//  ResourceList.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation
import SwiftyJSON

public struct ResourceList<T: EntitySummary>: JSONSerializable {
  
  public let available: Int
  public let returned: Int
  public let collectionURI: String
  public let items: [T]
  
  public init(json: JSON) {
    self.available = json["available"].int!
    self.returned = json["returned"].int!
    self.collectionURI = json["collectionURI"].string!
    self.items = json["items"].array!.map { T(json: $0) }
  }
}
