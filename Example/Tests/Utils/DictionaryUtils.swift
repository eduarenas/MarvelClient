//
//  DictionaryUtils.swift
//  MarvelClient
//
//  Created by Eduardo Arenas on 5/10/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest
@testable import MarvelClient

class DictionaryUtils: XCTestCase {
  
  func testPlusSignMergedDictionaries() {
    let lhsDict = ["a": 1, "b": 2]
    let rhsDict = ["c": 3, "d": 4]
    XCTAssertEqual(lhsDict + rhsDict, ["a": 1, "b": 2, "c": 3, "d": 4])
  }
  
  func testRepeatedKeyCausesMergeToPreferRhsValue() {
    let lhsDict = ["a": 1, "b": 2]
    let rhsDict = ["c": 3, "d": 4, "b": 5]
    XCTAssertEqual(lhsDict + rhsDict, ["a": 1, "b": 5, "c": 3, "d": 4])
  }
}
