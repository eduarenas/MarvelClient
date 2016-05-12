//
//  JSONUtilsTests.swift
//  MarvelClient
//
//  Created by Eduardo Arenas on 5/10/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest
@testable import MarvelClient
import SwiftyJSON

class JSONUtilsTests: XCTestCase {
  
  func testDateTimeFromStringWithTimeZone() {
    let dateComponents = NSDateComponents()
    dateComponents.year = 2014
    dateComponents.month = 3
    dateComponents.day = 3
    dateComponents.hour = 10
    dateComponents.minute = 0
    dateComponents.timeZone = NSTimeZone(abbreviation: "UTC")
    
    let date = NSCalendar.currentCalendar().dateFromComponents(dateComponents)
    
    let jsonDate = JSON(stringLiteral: "2014-03-03T10:00:00-0000")
    XCTAssertEqual(jsonDate.dateTime, date)
  }
  
  func testDateTimeFromStringWithoutTimeZone() {
    let dateComponents = NSDateComponents()
    dateComponents.year = 2014
    dateComponents.month = 3
    dateComponents.day = 3
    dateComponents.hour = 10
    dateComponents.minute = 0
    let date = NSCalendar.currentCalendar().dateFromComponents(dateComponents)
    
    let jsonDate = JSON(stringLiteral: "2014-03-03 10:00:00")
    XCTAssertEqual(jsonDate.dateTime, date)
  }
  
  func testDateTimeReturnsNilIfNotADate() {
    let jsonNotADate = JSON(stringLiteral: "Not a date")
    XCTAssertNil(jsonNotADate.dateTime)
  }
  
  func testDateTimeReturnsNilIfNotAString() {
    let jsonNotADate = JSON(arrayLiteral: ["2014-03-03 10:00:00"])
    XCTAssertNil(jsonNotADate.dateTime)
  }
}
