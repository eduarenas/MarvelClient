//
//  JSONUtils.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation
import SwiftyJSON

extension JSON {
  var date: NSDate? {
    get {
      switch self.type {
      case .String:
        return MarvelDateFormatter.marvelDateFormatter.dateFromString(self.object as! String)
      default:
        return nil
      }
    }
  }
}
