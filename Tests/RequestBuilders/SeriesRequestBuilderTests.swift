//
//  SeriesRequestBuilderTests.swift
//  MarvelClient
//
//  Created by Eduardo Arenas on 5/20/16.
//  Copyright © 2016 Eduardo Arenas. All rights reserved.
//

import XCTest
@testable import MarvelClient

class SeriesRequestBuilderTests: XCTestCase {
  
  let marvelClient = MarvelClient(privateKey: "private", publicKey: "public")
  var requestBuilder: SeriesRequestBuilder?
  
  override func setUp() {
    super.setUp()
    self.requestBuilder = self.marvelClient.requestSeries()
  }
  
  func testGetsInitializedWithSeriesEntityType() {
    XCTAssertEqual(self.requestBuilder?.entityType, "series")
  }
  
  func testDefaultRequestContainsAuthParameters() {
    XCTAssertNotNil(self.requestBuilder!.parameters["ts"])
    XCTAssertEqual(self.requestBuilder!.parameters["apikey"] as? String, "public")
    XCTAssertNotNil(self.requestBuilder!.parameters["hash"])
  }
  
  func testTitleGetsSetOnRequest() {
    let builder = self.requestBuilder!.title("Black Panther")
    XCTAssertEqual(builder.parameters["title"] as? String, "Black Panther")
  }
  
  func testTitleStartsWithGetsSetOnRequest() {
    let builder = self.requestBuilder!.titleStartsWith("Black")
    XCTAssertEqual(builder.parameters["titleStartsWith"] as? String, "Black")
  }
  
  func testStartYearGetsSetOnRequest() {
    let builder = self.requestBuilder!.startYear(1988)
    XCTAssertEqual(builder.parameters["startYear"] as? Int, 1988)
  }
  
  func testComicsGetsSetOnRequest() {
    let builder = self.requestBuilder!.comics([1, 2, 3])
    XCTAssertEqual(builder.parameters["comics"] as? String, "1,2,3")
  }
  
  func testStoriesGetsSetOnRequest() {
    let builder = self.requestBuilder!.stories([1, 2, 3])
    XCTAssertEqual(builder.parameters["stories"] as? String, "1,2,3")
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
  
  func testSeriesTypeGetsSetOnRequest() {
    let builder = self.requestBuilder!.seriesType(.Collection)
    XCTAssertEqual(builder.parameters["seriesType"] as? String, "collection")
    
    builder.seriesType(.OneShot)
    XCTAssertEqual(builder.parameters["seriesType"] as? String, "one shot")
    
    builder.seriesType(.Limited)
    XCTAssertEqual(builder.parameters["seriesType"] as? String, "limited")
    
    builder.seriesType(.Ongoing)
    XCTAssertEqual(builder.parameters["seriesType"] as? String, "ongoing")
  }
  
  func testContainsGetsSetOnRequest() {
    let builder = self.requestBuilder!.contains([.Comic])
    XCTAssertEqual(builder.parameters["contains"] as? String, "comic")
    
    builder.contains([.Magazine])
    XCTAssertEqual(builder.parameters["contains"] as? String, "magazine")
    
    builder.contains([.TradePaperback])
    XCTAssertEqual(builder.parameters["contains"] as? String, "trade paperback")
    
    builder.contains([.Hardcover])
    XCTAssertEqual(builder.parameters["contains"] as? String, "hardcover")
  }
  
  func testContainsGetsSetOnRequestWithMultipleCriteria() {
    let builder = self.requestBuilder!.contains([.Magazine, .Hardcover, .TradePaperback])
    XCTAssertEqual(builder.parameters["contains"] as? String, "magazine,hardcover,trade paperback")
  }
  
  func testOrderByGetsSetOnRequest() {
    let builder = self.requestBuilder!.orderBy([.Title])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "title")
    
    builder.orderBy([.StartYear])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "startYear")
    
    builder.orderBy([.Modified])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "modified")
    
    builder.orderBy([.TitleDescending])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "-title")
    
    builder.orderBy([.StartYearDescending])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "-startYear")
    
    builder.orderBy([.ModifiedDescending])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "-modified")
  }
  
  func testOrderByGetsSetOnRequestWithMultipleCriteria() {
    let builder = self.requestBuilder!.orderBy([.Title, .StartYearDescending, .ModifiedDescending])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "title,-startYear,-modified")
  }
}
