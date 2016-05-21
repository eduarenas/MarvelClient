//
//  JSONUtils.swift
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
