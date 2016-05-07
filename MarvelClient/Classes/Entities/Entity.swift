//
//  Entity.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation

protocol Entity: JSONSerializable {
  
}

protocol EntitySummary: JSONSerializable {
  var resourceURI: String { get }
  var name: String { get }
}
