//
//  JSONUtils.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation
import SwiftyJSON

// Converts string data to NSDate using Marvel's format (2014-04-29T14:18:17-0400)
extension JSON {
  public var date: NSDate? {
    get {
      switch self.type {
      case .String:
        return DateFormatter.jsonDateFormatter.dateFromString(self.object as! String)
      default:
        return nil
      }
    }
  }
}

private class DateFormatter {
  
  private static var internalJsonDateFormatter: NSDateFormatter?
  
  static var jsonDateFormatter: NSDateFormatter {
    if (internalJsonDateFormatter == nil) {
      internalJsonDateFormatter = NSDateFormatter()
      internalJsonDateFormatter!.dateFormat =  "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZ"
    }
    return internalJsonDateFormatter!
  }
}