//
//  DateUtilsTests.swift
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

import XCTest
@testable import MarvelClient

class DateUtilsTests: XCTestCase {
  
  var date: NSDate?
  
  override func setUp() {
    super.setUp()
    
    let dateComponents = NSDateComponents()
    dateComponents.year = 2014
    dateComponents.month = 3
    dateComponents.day = 3
    dateComponents.hour = 10
    dateComponents.minute = 0
    dateComponents.timeZone = NSTimeZone(abbreviation: "UTC")
    
    self.date = NSCalendar.currentCalendar().dateFromComponents(dateComponents)
  }
  
  func testMarvelDateTimeFormattedCorrectly() {
    XCTAssertEqual(self.date?.marvelDateTimeString, "2014-03-03T10:00:00+0000")
  }
  
  func testMarvelDateFormattedCorrectly() {
    XCTAssertEqual(self.date?.marvelDateString, "2014-03-03")
  }
}
