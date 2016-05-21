//
//  ComicRequestBuilderTests.swift
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

class ComicRequestBuilderTests: XCTestCase {
  
  let marvelClient = MarvelClient(privateKey: "private", publicKey: "public")
  var requestBuilder: ComicRequestBuilder?
  
  override func setUp() {
    super.setUp()
    self.requestBuilder = self.marvelClient.requestComics()
  }
  
  func testGetsInitializedWithComicEntityType() {
    XCTAssertEqual(self.requestBuilder?.entityType, "comics")
  }
  
  func testDefaultRequestContainsAuthParameters() {
    XCTAssertNotNil(self.requestBuilder!.parameters["ts"])
    XCTAssertEqual(self.requestBuilder!.parameters["apikey"] as? String, "public")
    XCTAssertNotNil(self.requestBuilder!.parameters["hash"])
  }
  
  func testFormatGetsSetOnRequest() {
    let builder = self.requestBuilder!.format(.Comic)
    XCTAssertEqual(builder.parameters["format"] as? String, "comic")
    
    builder.format(.Magazine)
    XCTAssertEqual(builder.parameters["format"] as? String, "magazine")
    
    builder.format(.TradePaperback)
    XCTAssertEqual(builder.parameters["format"] as? String, "trade paperback")
    
    builder.format(.Hardcover)
    XCTAssertEqual(builder.parameters["format"] as? String, "hardcover")
    
    builder.format(.Digest)
    XCTAssertEqual(builder.parameters["format"] as? String, "digest")
    
    builder.format(.GraphicNovel)
    XCTAssertEqual(builder.parameters["format"] as? String, "graphic novel")
    
    builder.format(.DigitalComic)
    XCTAssertEqual(builder.parameters["format"] as? String, "digital comic")
    
    builder.format(.InfiniteComic)
    XCTAssertEqual(builder.parameters["format"] as? String, "infinite comic")
  }

  func testFormatTypeGetsSetOnRequest() {
    let builder = self.requestBuilder!.formatType(.Comic)
    XCTAssertEqual(builder.parameters["formatType"] as? String, "comic")
    
    builder.formatType(.Collection)
    XCTAssertEqual(builder.parameters["formatType"] as? String, "collection")
  }
  
  func testNoVariantsGetsSetOnRequest() {
    let builder = self.requestBuilder!.noVariants(true)
    XCTAssertEqual(builder.parameters["noVariants"] as? Bool, true)
    
    builder.noVariants(false)
    XCTAssertEqual(builder.parameters["noVariants"] as? Bool, false)
  }
  
  func testDateDescriptorGetsSetOnRequest() {
    let builder = self.requestBuilder!.dateDescriptor(.LastWeek)
    XCTAssertEqual(builder.parameters["dateDescriptor"] as? String, "lastWeek")
    
    builder.dateDescriptor(.ThisWeek)
    XCTAssertEqual(builder.parameters["dateDescriptor"] as? String, "thisWeek")
    
    builder.dateDescriptor(.NextWeek)
    XCTAssertEqual(builder.parameters["dateDescriptor"] as? String, "nextWeek")
    
    builder.dateDescriptor(.ThisMonth)
    XCTAssertEqual(builder.parameters["dateDescriptor"] as? String, "thisMonth")
  }
  
  func testDateRangeGetsSetOnRequest() {
    let dateComponents1 = NSDateComponents()
    dateComponents1.year = 2014
    dateComponents1.month = 3
    dateComponents1.day = 3
    let date1 = NSCalendar.currentCalendar().dateFromComponents(dateComponents1)!
    
    let dateComponents2 = NSDateComponents()
    dateComponents2.year = 2015
    dateComponents2.month = 5
    dateComponents2.day = 19
    let date2 = NSCalendar.currentCalendar().dateFromComponents(dateComponents2)!
    
    let builder = self.requestBuilder!.dateRange(DateRange(startDate: date1, endDate: date2))
    XCTAssertEqual(builder.parameters["dateRange"] as? String, "2014-03-03,2015-05-19")
  }
  
  func testTitleGetsSetOnRequest() {
    let builder = self.requestBuilder!.title("Iron Man")
    XCTAssertEqual(builder.parameters["title"] as? String, "Iron Man")
  }
  
  func testTitleStartsWithGetsSetOnRequest() {
    let builder = self.requestBuilder!.titleStartsWith("Iron")
    XCTAssertEqual(builder.parameters["titleStartsWith"] as? String, "Iron")
  }
  
  func testStartYearGetsSetOnRequest() {
    let builder = self.requestBuilder!.startYear(2012)
    XCTAssertEqual(builder.parameters["startYear"] as? Int, 2012)
  }
  
  func testIssueNumberGetsSetOnRequest() {
    let builder = self.requestBuilder!.issueNumber(20123)
    XCTAssertEqual(builder.parameters["issueNumber"] as? Int, 20123)
  }
  
  func testDiamondCodeGetsSetOnRequest() {
    let builder = self.requestBuilder!.diamondCode("Diamond Code")
    XCTAssertEqual(builder.parameters["diamondCode"] as? String, "Diamond Code")
  }
  
  func testDigitalIdGetsSetOnRequest() {
    let builder = self.requestBuilder!.digitalId(20123)
    XCTAssertEqual(builder.parameters["digitalId"] as? Int, 20123)
  }
  
  func testUpcGetsSetOnRequest() {
    let builder = self.requestBuilder!.upc("upc")
    XCTAssertEqual(builder.parameters["upc"] as? String, "upc")
  }
  
  func testIsbnGetsSetOnRequest() {
    let builder = self.requestBuilder!.isbn("isbn")
    XCTAssertEqual(builder.parameters["isbn"] as? String, "isbn")
  }
  
  func testEanGetsSetOnRequest() {
    let builder = self.requestBuilder!.ean("ean")
    XCTAssertEqual(builder.parameters["ean"] as? String, "ean")
  }
  
  func testIssnGetsSetOnRequest() {
    let builder = self.requestBuilder!.issn("issn")
    XCTAssertEqual(builder.parameters["issn"] as? String, "issn")
  }
  
  func testHasDigitalIssueGetsSetOnRequest() {
    let builder = self.requestBuilder!.hasDigitalIssue(true)
    XCTAssertEqual(builder.parameters["hasDigitalIssue"] as? Bool, true)
    
    builder.hasDigitalIssue(false)
    XCTAssertEqual(builder.parameters["hasDigitalIssue"] as? Bool, false)
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
  
  func testEventsGetsSetOnRequest() {
    let builder = self.requestBuilder!.events([1, 2, 3])
    XCTAssertEqual(builder.parameters["events"] as? String, "1,2,3")
  }
  
  func testStoriesGetsSetOnRequest() {
    let builder = self.requestBuilder!.stories([1, 2, 3])
    XCTAssertEqual(builder.parameters["stories"] as? String, "1,2,3")
  }
  
  func testSharedAppearancesGetsSetOnRequest() {
    let builder = self.requestBuilder!.sharedAppearances([1, 2, 3])
    XCTAssertEqual(builder.parameters["sharedAppearances"] as? String, "1,2,3")
  }
  
  func testCollaboratorsGetsSetOnRequest() {
    let builder = self.requestBuilder!.collaborators([1, 2, 3])
    XCTAssertEqual(builder.parameters["collaborators"] as? String, "1,2,3")
  }

  func testOrderByGetsSetOnRequest() {
    let builder = self.requestBuilder!.orderBy([.FocDate])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "focDate")
    
    builder.orderBy([.OnsaleDate])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "onsaleDate")
    
    builder.orderBy([.Title])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "title")
    
    builder.orderBy([.IssueNumber])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "issueNumber")
    
    builder.orderBy([.Modified])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "modified")
    
    builder.orderBy([.FocDateDescending])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "-focDate")
    
    builder.orderBy([.OnsaleDateDescending])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "-onsaleDate")
    
    builder.orderBy([.TitleDescending])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "-title")
    
    builder.orderBy([.IssueNumberDescending])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "-issueNumber")
    
    builder.orderBy([.ModifiedDescending])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "-modified")
  }

  func testOrderByGetsSetOnRequestWithMultipleCriteria() {
    let builder = self.requestBuilder!.orderBy([.FocDate, .OnsaleDateDescending])
    XCTAssertEqual(builder.parameters["orderBy"] as? String, "focDate,-onsaleDate")
  }
}
