//
//  StoryRequestBuilderTests.swift
//  MarvelClient
//
//  Created by Eduardo Arenas on 5/20/16.
//  Copyright © 2016 Eduardo Arenas. All rights reserved.
//

import XCTest
@testable import MarvelClient

class StoryRequestBuilderTests: XCTestCase {
  
  let marvelClient = MarvelClient(privateKey: "private", publicKey: "public")
  var requestBuilder: StoryRequestBuilder?
  
  override func setUp() {
    super.setUp()
    self.requestBuilder = self.marvelClient.requestStories()
  }
  
  func testGetsInitializedWithStoriesEntityType() {
    XCTAssertEqual(self.requestBuilder?.entityType, "stories")
  }
  
  func testDefaultRequestContainsAuthParameters() {
    XCTAssertNotNil(self.requestBuilder!.parameters["ts"])
    XCTAssertEqual(self.requestBuilder!.parameters["apikey"] as? String, "public")
    XCTAssertNotNil(self.requestBuilder!.parameters["hash"])
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
  
  func testCreatorsGetsSetOnRequest() {
    let builder = self.requestBuilder!.creators([1, 2, 3])
    XCTAssertEqual(builder.parameters["creators"] as? String, "1,2,3")
  }
  
  func testCharactersGetsSetOnRequest() {
    let builder = self.requestBuilder!.characters([1, 2, 3])
    XCTAssertEqual(builder.parameters["characters"] as? String, "1,2,3")
  }
  
  func testOrderByGetsSetOnRequest() {
    let builder = self.requestBuilder!.orderBy([.Id])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "id")
    
    builder.orderBy([.Modified])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "modified")
    
    builder.orderBy([.IdDescending])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "-id")
    
    builder.orderBy([.ModifiedDescending])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "-modified")
  }
  
  func testOrderByGetsSetOnRequestWithMultipleCriteria() {
    let builder = self.requestBuilder!.orderBy([.Modified, .IdDescending])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "modified,-id")
  }
}
