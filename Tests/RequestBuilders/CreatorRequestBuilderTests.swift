//
//  CreatorRequestBuilderTests.swift
//  MarvelClient
//
//  Created by Eduardo Arenas on 5/20/16.
//  Copyright © 2016 Eduardo Arenas. All rights reserved.
//

import XCTest
@testable import MarvelClient

class CreatorRequestBuilderTests: XCTestCase {
  
  let marvelClient = MarvelClient(privateKey: "private", publicKey: "public")
  var requestBuilder: CreatorRequestBuilder?
  
  override func setUp() {
    super.setUp()
    self.requestBuilder = self.marvelClient.requestCreators()
  }
  
  func testGetsInitializedWithCreatorsEntityType() {
    XCTAssertEqual(self.requestBuilder?.entityType, "creators")
  }
  
  func testDefaultRequestContainsAuthParameters() {
    XCTAssertNotNil(self.requestBuilder!.parameters["ts"])
    XCTAssertEqual(self.requestBuilder!.parameters["apikey"] as? String, "public")
    XCTAssertNotNil(self.requestBuilder!.parameters["hash"])
  }
  
  func testFirstNameTitleGetsSetOnRequest() {
    let builder = self.requestBuilder!.firstName("Stan")
    XCTAssertEqual(builder.parameters["firstName"] as? String, "Stan")
  }
  
  func testMiddleNameWithGetsSetOnRequest() {
    let builder = self.requestBuilder!.middleName("Martin")
    XCTAssertEqual(builder.parameters["middleName"] as? String, "Martin")
  }
  
  func testLastNameWithGetsSetOnRequest() {
    let builder = self.requestBuilder!.lastName("Lee")
    XCTAssertEqual(builder.parameters["lastName"] as? String, "Lee")
  }
  
  func testSuffixWithGetsSetOnRequest() {
    let builder = self.requestBuilder!.suffix("Jr")
    XCTAssertEqual(builder.parameters["suffix"] as? String, "Jr")
  }
  
  func testFirstNameStartsWithTitleGetsSetOnRequest() {
    let builder = self.requestBuilder!.firstNameStartsWith("Stan")
    XCTAssertEqual(builder.parameters["firstNameStartsWith"] as? String, "Stan")
  }
  
  func testMiddleNameStartsWithWithGetsSetOnRequest() {
    let builder = self.requestBuilder!.middleNameStartsWith("Martin")
    XCTAssertEqual(builder.parameters["middleNameStartsWith"] as? String, "Martin")
  }
  
  func testLastNameStartsWithWithGetsSetOnRequest() {
    let builder = self.requestBuilder!.lastNameStartsWith("Lee")
    XCTAssertEqual(builder.parameters["lastNameStartsWith"] as? String, "Lee")
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
  
  func testOrderByGetsSetOnRequest() {
    let builder = self.requestBuilder!.orderBy([.LastName])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "lastName")
    
    builder.orderBy([.FirstName])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "firstName")
    
    builder.orderBy([.MiddleName])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "middleName")
    
    builder.orderBy([.Suffix])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "suffix")
    
    builder.orderBy([.Modified])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "modified")
    
    builder.orderBy([.LastNameDescending])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "-lastName")
    
    builder.orderBy([.FirstNameDescending])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "-firstName")
    
    builder.orderBy([.MiddleNameDescending])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "-middleName")
    
    builder.orderBy([.SuffixDescending])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "-suffix")
    
    builder.orderBy([.ModifiedDescending])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "-modified")
  }
  
  func testOrderByGetsSetOnRequestWithMultipleCriteria() {
    let builder = self.requestBuilder!.orderBy([.FirstName, .SuffixDescending])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "firstName,-suffix")
  }
}

