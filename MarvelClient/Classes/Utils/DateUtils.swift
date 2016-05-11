//
//  DateUtils.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation

extension NSDate {
  /// Get a combined date and time in UTC string representation using the ISO 8601 standard
  /// used by Marvel's API.  For example:
  ///
  ///     2014-03-03T10:00:00-0500
  /// - returns: String representation of the date using ISO 8601
  var marvelDateTimeString: String {
    return MarvelDateFormatter.marvelDateTimeFormatterWithTimezone.stringFromDate(self)
  }
  
  /// Get a date string representation using the ISO 8601 standard used by Marvel's API.
  /// For example:
  ///
  ///     2014-03-03
  /// - returns: String representation of the date usin ISO 8601
  var marvelDateString: String {
    return MarvelDateFormatter.marvelDateFormatter.stringFromDate(self)
  }
}

class MarvelDateFormatter {
  
  private static var internalMarvelDateTimeFormatterWithTimezone: NSDateFormatter?
  private static var internalMarvelDateTimeFormatter: NSDateFormatter?
  private static var internalMarvelDateFormatter: NSDateFormatter?
  
  /// Get a combined date and time in UTC date formatter to convert to and from the ISO 8601 standard
  /// used by Marvel's API.  For example:
  ///
  ///     2014-03-03T10:00:00-0500
  /// - returns: Date formatter to convert combined date and times to and from ISO 8601 with a timezone
  static var marvelDateTimeFormatterWithTimezone: NSDateFormatter {
    if (internalMarvelDateTimeFormatterWithTimezone == nil) {
      internalMarvelDateTimeFormatterWithTimezone = NSDateFormatter()
      internalMarvelDateTimeFormatterWithTimezone!.dateFormat =  "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZ"
    }
    return internalMarvelDateTimeFormatterWithTimezone!
  }
  
  /// Get a combined date and time in date formatter to convert to and from the ISO 8601 standard
  /// used by Marvel's API.  For example:
  ///
  ///     2014-03-03T10:00:00
  /// - returns: Date formatter to convert combined date and times to and from ISO 8601 without a timezone
  static var marvelDateTimeFormatter: NSDateFormatter {
    if (internalMarvelDateTimeFormatter == nil) {
      internalMarvelDateTimeFormatter = NSDateFormatter()
      internalMarvelDateTimeFormatter!.dateFormat =  "yyyy'-'MM'-'dd' 'HH':'mm':'ss"
    }
    return internalMarvelDateTimeFormatter!
  }
  
  /// Get a date formatter to convert to and from the ISO 8601 standard
  /// used by Marvel's API.  For example:
  ///
  ///     2014-03-03
  /// - returns: Date formatter to convert dates to and from ISO 8601
  static var marvelDateFormatter: NSDateFormatter {
    if (internalMarvelDateFormatter == nil) {
      internalMarvelDateFormatter = NSDateFormatter()
      internalMarvelDateFormatter!.dateFormat =  "yyyy'-'MM'-'dd"
    }
    return internalMarvelDateFormatter!
  }
}
