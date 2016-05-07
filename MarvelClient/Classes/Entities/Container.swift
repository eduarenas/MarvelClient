//
//  Container.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation
import SwiftyJSON

public struct Container<T: JSONSerializable>: JSONSerializable {
  
  public let offset: Int
  public let limit: Int
  public let total: Int
  public let count: Int
  public let results: [T]
  
  public init(json: JSON) {
    self.offset = json["offset"].int!
    self.limit = json["limit"].int!
    self.total = json["total"].int!
    self.count = json["count"].int!
    self.results = json["results"].array!.map { T(json: $0) }
  }
}
