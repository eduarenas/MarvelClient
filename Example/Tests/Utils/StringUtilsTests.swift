//
//  StringUtils.swift
//  MarvelClient
//
//  Created by Eduardo Arenas on 5/10/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest
@testable import MarvelClient

class StringUtils: XCTestCase {
    
  func testMD5HashGeneratedCorrectly() {
    XCTAssertEqual("hash string".md5Hash, "00d0edf095c6050740f809ee5a6acc66")
  }
}
