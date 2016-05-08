//
//  DateUtils.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation

extension NSDate {
  var marvelDateTimeString: String {
    return MarvelDateFormatter.marvelDateTimeFormatterWithTimezone.stringFromDate(self)
  }
  
  var marvelDateString: String {
    return MarvelDateFormatter.marvelDateFormatter.stringFromDate(self)
  }
}

// Converts string data to NSDate using Marvel's formatd (2014-04-29T14:18:17-0400, 2007-01-29 00:00:00)
class MarvelDateFormatter {
  
  private static var internalMarvelDateTimeFormatterWithTimezone: NSDateFormatter?
  private static var internalMarvelDateTimeFormatter: NSDateFormatter?
  private static var internalMarvelDateFormatter: NSDateFormatter?
  
  static var marvelDateTimeFormatterWithTimezone: NSDateFormatter {
    if (internalMarvelDateTimeFormatterWithTimezone == nil) {
      internalMarvelDateTimeFormatterWithTimezone = NSDateFormatter()
      internalMarvelDateTimeFormatterWithTimezone!.dateFormat =  "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZ"
    }
    return internalMarvelDateTimeFormatterWithTimezone!
  }
  
  static var marvelDateTimeFormatter: NSDateFormatter {
    if (internalMarvelDateTimeFormatter == nil) {
      internalMarvelDateTimeFormatter = NSDateFormatter()
      internalMarvelDateTimeFormatter!.dateFormat =  "yyyy'-'MM'-'dd' 'HH':'mm':'ss"
    }
    return internalMarvelDateTimeFormatter!
  }
  
  static var marvelDateFormatter: NSDateFormatter {
    if (internalMarvelDateFormatter == nil) {
      internalMarvelDateFormatter = NSDateFormatter()
      internalMarvelDateFormatter!.dateFormat =  "yyyy'-'MM'-'dd"
    }
    return internalMarvelDateFormatter!
  }
}
