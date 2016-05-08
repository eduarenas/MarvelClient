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
        let stringSelf = self.object as! String
        return MarvelDateFormatter.marvelDateTimeFormatterWithTimezone.dateFromString(stringSelf) ?? MarvelDateFormatter.marvelDateTimeFormatter.dateFromString(stringSelf)
      default:
        return nil
      }
    }
  }
}
