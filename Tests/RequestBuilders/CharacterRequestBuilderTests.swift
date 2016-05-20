//
//  CharacterRequestBuilderTests.swift
//  MarvelClient
//
//  Created by Eduardo Arenas on 5/12/16.
//  Copyright © 2016 Eduardo Arenas. All rights reserved.
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
  
  func testNameParameterGetsSetOnRequest() {
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
  
  func testEvensGetsSetOnRequest() {
    let builder = self.requestBuilder!.events([1, 2, 3])
    XCTAssertEqual(builder.parameters["events"] as? String, "1,2,3")
  }
  
  func testStoriesGetsSetOnRequest() {
    let builder = self.requestBuilder!.stories([1, 2, 3])
    XCTAssertEqual(builder.parameters["stories"] as? String, "1,2,3")
  }
  
  func testOrderByGetsSetOnRequestForName() {
    let builder = self.requestBuilder!.orderBy([.Name])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "name")
  }

  func testOrderByGetsSetOnRequestForModified() {
    let builder = self.requestBuilder!.orderBy([.Modified])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "modified")
  }
  
  func testOrderByGetsSetOnRequestForNameDescending() {
    let builder = self.requestBuilder!.orderBy([.NameDescending])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "-name")
  }
  
  func testOrderByGetsSetOnRequestForModifiedDescending() {
    let builder = self.requestBuilder!.orderBy([.ModifiedDescending])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "-modified")
  }
  
  func testOrderByGetsSetOnRequestWithMultipleCriteria() {
    let builder = self.requestBuilder!.orderBy([.Name, .ModifiedDescending])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "name,-modified")
  }
}
