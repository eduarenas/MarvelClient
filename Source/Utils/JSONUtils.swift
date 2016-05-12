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
  
  /**
   Get an `NSDate` from the JSON object that contains a string formatted using the ISO 8601
   standard for combined data and time with UTC. If a time zone isn't included in the string
   it attempts to create an `NSDate` object without one
   
   - returns: NSDate representation of the string object or nil if the JSON object isn't a string
   or if it doesn't represent a date in the ISO 8601 format.
   */
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
