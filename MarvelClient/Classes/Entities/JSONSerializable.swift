//
//  JSONSerializable.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation
import SwiftyJSON

protocol JSONSerializable {
  init(json: JSON)
}
