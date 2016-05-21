//
//  CreatorRequestBuilder.swift
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

import Foundation

public class CreatorRequestBuilder: MarvelRequestBuilder {
  
  private let entityTypeString = "creators"
  
  public var firstName: String?
  public var middleName: String?
  public var lastName: String?
  public var suffix: String?
  public var firstNameStartsWith: String?
  public var middleNameStartsWith: String?
  public var lastNameStartsWith: String?
  public var comics: [Int]?
  public var series: [Int]?
  public var events: [Int]?
  public var stories: [Int]?
  public var orderBy: [CreatorOrder]?
  
  init(keys: MarvelAPIKeys) {
    super.init(entityType: self.entityTypeString, keys: keys)
  }
  
  public func fetch(completionHandler: Wrapper<Creator> -> Void) {
    super.fetchResults(completionHandler)
  }
  
  public func firstName(firstName: String) -> Self {
    self.firstName = firstName
    return self
  }
  
  public func middleName(middleName: String) -> Self {
    self.middleName = middleName
    return self
  }
  
  public func lastName(lastName: String) -> Self {
    self.lastName = lastName
    return self
  }
  
  public func suffix(suffix: String) -> Self {
    self.suffix = suffix
    return self
  }
  
  public func firstNameStartsWith(firstNameStartsWith: String) -> Self {
    self.firstNameStartsWith = firstNameStartsWith
    return self
  }
  
  public func middleNameStartsWith(middleNameStartsWith: String) -> Self {
    self.middleNameStartsWith = middleNameStartsWith
    return self
  }
  
  public func lastNameStartsWith(lastNameStartsWith: String) -> Self {
    self.lastNameStartsWith = lastNameStartsWith
    return self
  }
  
  public func comics(comics: [Int]) -> Self {
    self.comics = comics
    return self
  }
  
  public func series(series: [Int]) -> Self {
    self.series = series
    return self
  }
  
  public func events(events: [Int]) -> Self {
    self.events = events
    return self
  }
  
  public func stories(stories: [Int]) -> Self {
    self.stories = stories
    return self
  }
  
  public func orderBy(orderBy: [CreatorOrder]) -> Self {
    self.orderBy = orderBy
    return self
  }
  
  override func buildQueryParameters() -> [String : AnyObject] {
    var queryParameters = super.buildQueryParameters()
    
    if let firstName = self.firstName {
      queryParameters["firstName"] = firstName
    }
    if let middleName = self.middleName {
      queryParameters["middleName"] = middleName
    }
    if let lastName = self.lastName {
      queryParameters["lastName"] = lastName
    }
    if let suffix = self.suffix {
      queryParameters["suffix"] = suffix
    }
    if let firstNameStartsWith = self.firstNameStartsWith {
      queryParameters["firstNameStartsWith"] = firstNameStartsWith
    }
    if let middleNameStartsWith = self.middleNameStartsWith {
      queryParameters["middleNameStartsWith"] = middleNameStartsWith
    }
    if let lastNameStartsWith = self.lastNameStartsWith {
      queryParameters["lastNameStartsWith"] = lastNameStartsWith
    }
    if let comics = self.comics {
      queryParameters["comics"] = comics.joinDescriptionsWithSeparator(",")
    }
    if let series = self.series {
      queryParameters["series"] = series.joinDescriptionsWithSeparator(",")
    }
    if let events = self.events {
      queryParameters["events"] = events.joinDescriptionsWithSeparator(",")
    }
    if let stories = self.stories {
      queryParameters["stories"] = stories.joinDescriptionsWithSeparator(",")
    }
    if let orderBy = self.orderBy {
      queryParameters["orderBy"] = orderBy.joinDescriptionsWithSeparator(",")
    }
    
    return queryParameters
  }
}

public enum CreatorOrder: String, CustomStringConvertible {
  case LastName = "lastName"
  case FirstName = "firstName"
  case MiddleName = "middleName"
  case Suffix = "suffix"
  case Modified = "modified"
  case LastNameDescending = "-lastName"
  case FirstNameDescending = "-firstName"
  case MiddleNameDescending = "-middleName"
  case SuffixDescending = "-suffix"
  case ModifiedDescending = "-modified"
  
  public var description: String {
    return self.rawValue
  }
}
