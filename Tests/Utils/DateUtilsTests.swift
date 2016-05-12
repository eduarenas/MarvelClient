//
//  DateUtilsTests.swift
//  MarvelClient
//
//  Created by Eduardo Arenas on 5/10/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
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
    dateComponents.timeZone = NSTimeZone(abbreviation: "EST")
    
    self.date = NSCalendar.currentCalendar().dateFromComponents(dateComponents)
  }
  
  func testMarvelDateTimeFormattedCorrectly() {
    print(self.date!)
    XCTAssertEqual(self.date?.marvelDateTimeString, "2014-03-03T10:00:00-0500")
  }
  
  func testMarvelDateFormattedCorrectly() {
    print(self.date!)
    XCTAssertEqual(self.date?.marvelDateString, "2014-03-03")
  }
}
