//
//  MarvelRequestBuilderTests.swift
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

class MarvelRequestBuilderTests: XCTestCase {
  
  var requestBuilder: MarvelRequestBuilder?
  
  override func setUp() {
    super.setUp()
    self.requestBuilder = MarvelRequestBuilder(entityType: "characters", keys: ("private", "public"))
  }
  
  func testUrlGetsGeneratedForEntityType() {
    XCTAssertEqual(self.requestBuilder!.url, "https://gateway.marvel.com/v1/public/characters")
  }
  
  func testUrlGetsGeneratedForEntityTypeAndFilter() {
    let builder = self.requestBuilder!.filter((.Comics, 123))
    XCTAssertEqual(builder.url, "https://gateway.marvel.com/v1/public/comics/123/characters")
  }
  
  func testUrlGetsGeneratedForFetchingByEntity() {
    self.requestBuilder!.entityId = 123
    XCTAssertEqual(self.requestBuilder!.url, "https://gateway.marvel.com/v1/public/characters/123")
  }
  
  func testModifiedSinceGetsSetOnRequest() {
    let dateComponents = NSDateComponents()
    dateComponents.year = 2014
    dateComponents.month = 3
    dateComponents.day = 3
    dateComponents.hour = 10
    dateComponents.minute = 0
    dateComponents.timeZone = NSTimeZone(abbreviation: "UTC")
    let date = NSCalendar.currentCalendar().dateFromComponents(dateComponents)!
    
    let builder = self.requestBuilder!.modifiedSince(date)
    XCTAssertEqual(builder.parameters["modifiedSince"] as? String, "2014-03-03T10:00:00+0000")
  }
  
  func testLimitGetsSetOnRequest() {
    let builder = self.requestBuilder!.limit(10)
    XCTAssertEqual(builder.parameters["limit"] as? Int, 10)
  }
  
  func testOffsetGetsSetOnRequest() {
    let builder = self.requestBuilder!.offset(200)
    XCTAssertEqual(builder.parameters["offset"] as? Int, 200)
  }
}
