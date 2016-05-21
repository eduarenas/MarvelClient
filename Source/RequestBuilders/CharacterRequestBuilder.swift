//
//  CharacterRequestBuilder.swift
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

public class CharacterRequestBuilder: MarvelRequestBuilder {
  
  private let entityTypeString = "characters"
  
  public var name: String?
  public var nameStartsWith: String?
  public var comics: [Int]?
  public var series: [Int]?
  public var events: [Int]?
  public var stories: [Int]?
  public var orderBy: [CharacterOrder]?
  
  init(keys: MarvelAPIKeys) {
    super.init(entityType: self.entityTypeString, keys: keys)
  }

  public func fetch(completionHandler: Wrapper<Character> -> Void) {
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
  
  public func orderBy(orderBy: [CharacterOrder]) -> Self {
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

public enum CharacterOrder: String, CustomStringConvertible {
  case Name = "name"
  case Modified = "modified"
  case NameDescending = "-name"
  case ModifiedDescending = "-modified"
  
  public var description: String {
    return self.rawValue
  }
}
