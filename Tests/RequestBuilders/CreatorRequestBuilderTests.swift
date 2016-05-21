//
//  CreatorRequestBuilderTests.swift
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
  
  func testEventsGetsSetOnRequest() {
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

