//
//  EventRequestBuilderTests.swift
//  MarvelClient
//
//  Created by Eduardo Arenas on 5/20/16.
//  Copyright © 2016 Eduardo Arenas. All rights reserved.
//

import XCTest
@testable import MarvelClient

class EventRequestBuilderTests: XCTestCase {
  
  let marvelClient = MarvelClient(privateKey: "private", publicKey: "public")
  var requestBuilder: EventRequestBuilder?
  
  override func setUp() {
    super.setUp()
    self.requestBuilder = self.marvelClient.requestEvents()
  }
  
  func testGetsInitializedWithEventEntityType() {
    XCTAssertEqual(self.requestBuilder?.entityType, "events")
  }
  
  func testDefaultRequestContainsAuthParameters() {
    XCTAssertNotNil(self.requestBuilder!.parameters["ts"])
    XCTAssertEqual(self.requestBuilder!.parameters["apikey"] as? String, "public")
    XCTAssertNotNil(self.requestBuilder!.parameters["hash"])
  }
  
  func testNameGetsSetOnRequest() {
    let builder = self.requestBuilder!.name("Civil War")
    XCTAssertEqual(builder.parameters["name"] as? String, "Civil War")
  }
  
  func testNameStartsWithGetsSetOnRequest() {
    let builder = self.requestBuilder!.nameStartsWith("Civil")
    XCTAssertEqual(builder.parameters["nameStartsWith"] as? String, "Civil")
  }
  
  func testCreatorsGetsSetOnRequest() {
    let builder = self.requestBuilder!.creators([1, 2, 3])
    XCTAssertEqual(builder.parameters["creators"] as? String, "1,2,3")
  }
  
  func testCharactersGetsSetOnRequest() {
    let builder = self.requestBuilder!.characters([1, 2, 3])
    XCTAssertEqual(builder.parameters["characters"] as? String, "1,2,3")
  }
  
  func testSeriesGetsSetOnRequest() {
    let builder = self.requestBuilder!.series([1, 2, 3])
    XCTAssertEqual(builder.parameters["series"] as? String, "1,2,3")
  }
  
  func testComicsGetsSetOnRequest() {
    let builder = self.requestBuilder!.comics([1, 2, 3])
    XCTAssertEqual(builder.parameters["comics"] as? String, "1,2,3")
  }
  
  func testStoriesGetsSetOnRequest() {
    let builder = self.requestBuilder!.stories([1, 2, 3])
    XCTAssertEqual(builder.parameters["stories"] as? String, "1,2,3")
  }
  
  func testOrderByGetsSetOnRequest() {
    let builder = self.requestBuilder!.orderBy([.Name])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "name")
    
    builder.orderBy([.StartDate])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "startDate")
    
    builder.orderBy([.Modified])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "modified")
    
    builder.orderBy([.NameDescending])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "-name")
    
    builder.orderBy([.StartDateDescending])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "-startDate")
    
    builder.orderBy([.ModifiedDescending])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "-modified")
  }
  
  func testOrderByGetsSetOnRequestWithMultipleCriteria() {
    let builder = self.requestBuilder!.orderBy([.StartDate, .NameDescending, .ModifiedDescending])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "startDate,-name,-modified")
  }
}
