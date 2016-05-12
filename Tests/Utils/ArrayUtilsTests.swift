//
//  ArrayUtilsTests.swift
//  MarvelClient
//
//  Created by Eduardo Arenas on 5/10/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest
@testable import MarvelClient

class ArrayUtilsTests: XCTestCase {
  
  func testDescriptionsOfArrayAreJoinedCorrectly() {
    XCTAssertEqual([1, 2, 3].joinDescriptionsWithSeparator("-|-"), "1-|-2-|-3")
  }
  
  func testJoinOfEmptyArrayIsEmptyString() {
    let emptyArray = [Int]()
    XCTAssertEqual(emptyArray.joinDescriptionsWithSeparator(","), "")
  }
}
