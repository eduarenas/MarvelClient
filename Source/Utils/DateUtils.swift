//
//  DateUtils.swift
//  MarvelClient
//
//  Copyright (c) 2016 Eduardo Arenas <eapdev@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

extension NSDate {
  
  /**
   Get a combined date and time in UTC string representation using the ISO 8601 standard
   used by Marvel's API.  For example:
   
       2014-03-03T10:00:00-0500
   - returns: String representation of the date using ISO 8601
   */
  var marvelDateTimeString: String {
    return MarvelDateFormatter.marvelDateTimeFormatterWithTimezone.stringFromDate(self)
  }
  
  /**
   Get a date string representation using the ISO 8601 standard used by Marvel's API.
   For example:
   
       2014-03-03
   - returns: String representation of the date usin ISO 8601
   */
  var marvelDateString: String {
    return MarvelDateFormatter.marvelDateFormatter.stringFromDate(self)
  }
}

class MarvelDateFormatter {
  
  private static var internalMarvelDateTimeFormatterWithTimezone: NSDateFormatter?
  private static var internalMarvelDateTimeFormatter: NSDateFormatter?
  private static var internalMarvelDateFormatter: NSDateFormatter?
  
  /**
   Get a combined date and time in UTC date formatter to convert to and from the ISO 8601 standard
   used by Marvel's API.  For example:
   
       2014-03-03T10:00:00-0500
   - returns: Date formatter to convert combined date and times to and from ISO 8601 with a timezone
   */
  static var marvelDateTimeFormatterWithTimezone: NSDateFormatter {
    if (internalMarvelDateTimeFormatterWithTimezone == nil) {
      internalMarvelDateTimeFormatterWithTimezone = NSDateFormatter()
      internalMarvelDateTimeFormatterWithTimezone!.timeZone = NSTimeZone(abbreviation: "UTC")
      internalMarvelDateTimeFormatterWithTimezone!.dateFormat =  "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZ"
    }
    return internalMarvelDateTimeFormatterWithTimezone!
  }
  
  /**
   Get a combined date and time in date formatter to convert to and from the ISO 8601 standard
   used by Marvel's API (minus the T).  For example:
   
       2014-03-03 10:00:00
   - returns: Date formatter to convert combined date and times to and from ISO 8601 (minus the T) without a timezone
   */
  static var marvelDateTimeFormatter: NSDateFormatter {
    if (internalMarvelDateTimeFormatter == nil) {
      internalMarvelDateTimeFormatter = NSDateFormatter()
      internalMarvelDateTimeFormatter!.dateFormat =  "yyyy'-'MM'-'dd' 'HH':'mm':'ss"
    }
    return internalMarvelDateTimeFormatter!
  }
  
  /**
   Get a date formatter to convert to and from the ISO 8601 standard
   used by Marvel's API.  For example:
   
       2014-03-03
   - returns: Date formatter to convert dates to and from ISO 8601
   */
  static var marvelDateFormatter: NSDateFormatter {
    if (internalMarvelDateFormatter == nil) {
      internalMarvelDateFormatter = NSDateFormatter()
      internalMarvelDateFormatter!.dateFormat =  "yyyy'-'MM'-'dd"
    }
    return internalMarvelDateFormatter!
  }
}
