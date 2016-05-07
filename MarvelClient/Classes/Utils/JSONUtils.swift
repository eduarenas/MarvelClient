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
  var dateTime: NSDate? {
    get {
      switch self.type {
      case .String:
        return MarvelDateFormatter.marvelDateTimeFormatter.dateFromString(self.object as! String)
      default:
        return nil
      }
    }
  }
}
