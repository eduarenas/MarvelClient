//
//  Entity.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation
import SwiftyJSON

public protocol JSONSerializable {
  init(json: JSON)
}

public protocol Entity: JSONSerializable {
  var id: Int { get }
  var modified: NSDate? { get }
  var resourceURI: String { get }
  var thumbnail: Image { get }
}

public protocol EntitySummary: JSONSerializable {
  var resourceURI: String { get }
  var name: String { get }
}
