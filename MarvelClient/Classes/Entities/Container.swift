//
//  Container.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation
import SwiftyJSON

class Container<T: JSONSerializable>: JSONSerializable {
  let offset: Int?
  let limit: Int?
  let total: Int?
  let count: Int?
  let results: [T]?
  
  required init(json: JSON) {
    self.offset = json["offset"].int
    self.limit = json["limit"].int
    self.total = json["total"].int
    self.count = json["count"].int
    if let results = json["results"].array {
      self.results = results.map { T(json: $0) }
    } else {
      self.results = nil
    }
  }
}
