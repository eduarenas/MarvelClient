//
//  Entity.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation

public protocol Entity: JSONSerializable {
  
}

public protocol EntitySummary: JSONSerializable {
  var resourceURI: String { get }
  var name: String { get }
}
