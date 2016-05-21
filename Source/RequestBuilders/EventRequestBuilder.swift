//
//  EventRequestBuilder.swift
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

public class EventRequestBuilder: MarvelRequestBuilder {
  
  private let entityTypeString = "events"
  
  public var name: String?
  public var nameStartsWith: String?
  public var creators: [Int]?
  public var characters: [Int]?
  public var series: [Int]?
  public var comics: [Int]?
  public var stories: [Int]?
  public var orderBy: [EventOrder]?
  
  init(keys: MarvelAPIKeys) {
    super.init(entityType: self.entityTypeString, keys: keys)
  }
  
  public func fetch(completionHandler: Wrapper<Event> -> Void) {
    super.fetchResults(completionHandler)
  }
  
  public func name(name: String) -> Self {
    self.name = name
    return self
  }
  
  public func nameStartsWith(nameStartsWith: String) -> Self {
    self.nameStartsWith = nameStartsWith
    return self
  }

  public func creators(creators: [Int]) -> Self {
    self.creators = creators
    return self
  }
  
  public func characters(characters: [Int]) -> Self {
    self.characters = characters
    return self
  }
  
  public func series(series: [Int]) -> Self {
    self.series = series
    return self
  }
  
  public func comics(comics: [Int]) -> Self {
    self.comics = comics
    return self
  }

  public func stories(stories: [Int]) -> Self {
    self.stories = stories
    return self
  }
  
  public func orderBy(orderBy: [EventOrder]) -> Self {
    self.orderBy = orderBy
    return self
  }
  
  override func buildQueryParameters() -> [String : AnyObject] {
    var queryParameters = super.buildQueryParameters()
    
    if let name = self.name {
      queryParameters["name"] = name
    }
    if let nameStartsWith = self.nameStartsWith {
      queryParameters["nameStartsWith"] = nameStartsWith
    }
    if let creators = self.creators {
      queryParameters["creators"] = creators.joinDescriptionsWithSeparator(",")
    }
    if let characters = self.characters {
      queryParameters["characters"] = characters.joinDescriptionsWithSeparator(",")
    }
    if let comics = self.comics {
      queryParameters["comics"] = comics.joinDescriptionsWithSeparator(",")
    }
    if let series = self.series {
      queryParameters["series"] = series.joinDescriptionsWithSeparator(",")
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

public enum EventOrder: String, CustomStringConvertible {
  case Name = "name"
  case StartDate = "startDate"
  case Modified = "modified"
  case NameDescending = "-name"
  case StartDateDescending = "-startDate"
  case ModifiedDescending = "-modified"
  
  public var description: String {
    return self.rawValue
  }
}
