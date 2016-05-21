//
//  CharacterRequestBuilderTests.swift
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

class CharacterRequestBuilderTests: XCTestCase {
  
  let marvelClient = MarvelClient(privateKey: "private", publicKey: "public")
  var requestBuilder: CharacterRequestBuilder?
  
  override func setUp() {
    super.setUp()
    self.requestBuilder = self.marvelClient.requestCharacters()
  }
  
  func testGetsInitializedWithCharacterEntityType() {
    XCTAssertEqual(self.requestBuilder?.entityType, "characters")
  }
  
  func testDefaultRequestContainsAuthParameters() {
    XCTAssertNotNil(self.requestBuilder!.parameters["ts"])
    XCTAssertEqual(self.requestBuilder!.parameters["apikey"] as? String, "public")
    XCTAssertNotNil(self.requestBuilder!.parameters["hash"])
  }
  
  func testNameGetsSetOnRequest() {
    let builder = self.requestBuilder!.name("Spiderman")
    XCTAssertEqual(builder.parameters["name"] as? String, "Spiderman")
  }
  
  func testNameStartsWithGetsSetOnRequest() {
    let builder = self.requestBuilder!.nameStartsWith("Spider")
    XCTAssertEqual(builder.parameters["nameStartsWith"] as? String, "Spider")
  }

  func testComicsGetsSetOnRequest() {
    let builder = self.requestBuilder!.comics([1, 2, 3])
    XCTAssertEqual(builder.parameters["comics"] as? String, "1,2,3")
  }
  
  func testSeriesGetsSetOnRequest() {
    let builder = self.requestBuilder!.series([1, 2, 3])
    XCTAssertEqual(builder.parameters["series"] as? String, "1,2,3")
  }
  
  func testEventsGetsSetOnRequest() {
    let builder = self.requestBuilder!.events([1, 2, 3])
    XCTAssertEqual(builder.parameters["events"] as? String, "1,2,3")
  }
  
  func testStoriesGetsSetOnRequest() {
    let builder = self.requestBuilder!.stories([1, 2, 3])
    XCTAssertEqual(builder.parameters["stories"] as? String, "1,2,3")
  }
  
  func testOrderByGetsSetOnRequest() {
    let builder = self.requestBuilder!.orderBy([.Name])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "name")
    
    builder.orderBy([.Modified])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "modified")

    builder.orderBy([.NameDescending])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "-name")

    builder.orderBy([.ModifiedDescending])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "-modified")
  }
  
  func testOrderByGetsSetOnRequestWithMultipleCriteria() {
    let builder = self.requestBuilder!.orderBy([.Name, .ModifiedDescending])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "name,-modified")
  }
}
