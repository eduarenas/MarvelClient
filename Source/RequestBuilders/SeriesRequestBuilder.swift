//
//  SeriesRequestBuilder.swift
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

public class SeriesRequestBuilder: MarvelRequestBuilder {
  
  private let entityTypeString = "series"
  
  public var title: String?
  public var titleStartsWith: String?
  public var startYear: Int?
  public var comics: [Int]?
  public var stories: [Int]?
  public var events: [Int]?
  public var creators: [Int]?
  public var characters: [Int]?
  public var seriesType: SeriesType?
  public var contains: [ComicFormat]?
  public var orderBy: [SeriesOrder]?
  
  init(keys: MarvelAPIKeys) {
    super.init(entityType: self.entityTypeString, keys: keys)
  }
  
  public func fetch(completionHandler: Wrapper<Series> -> Void) {
    super.fetchResults(completionHandler)
  }
  
  public func title(title: String) -> Self {
    self.title = title
    return self
  }
  
  public func titleStartsWith(titleStartsWith: String) -> Self {
    self.titleStartsWith = titleStartsWith
    return self
  }
  
  public func startYear(startYear: Int) -> Self {
    self.startYear = startYear
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
  
  public func events(events: [Int]) -> Self {
    self.events = events
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
  
  public func seriesType(seriesType: SeriesType) -> Self {
    self.seriesType = seriesType
    return self
  }
  
  public func contains(contains: [ComicFormat]) -> Self {
    self.contains = contains
    return self
  }

  public func orderBy(orderBy: [SeriesOrder]) -> Self {
    self.orderBy = orderBy
    return self
  }
  
  override func buildQueryParameters() -> [String : AnyObject] {
    var queryParameters = super.buildQueryParameters()
    
    if let title = self.title {
      queryParameters["title"] = title
    }
    if let titleStartsWith = self.titleStartsWith {
      queryParameters["titleStartsWith"] = titleStartsWith
    }
    if let startYear = self.startYear {
      queryParameters["startYear"] = startYear
    }
    if let comics = self.comics {
      queryParameters["comics"] = comics.joinDescriptionsWithSeparator(",")
    }
    if let stories = self.stories {
      queryParameters["stories"] = stories.joinDescriptionsWithSeparator(",")
    }
    if let events = self.events {
      queryParameters["events"] = events.joinDescriptionsWithSeparator(",")
    }
    if let creators = self.creators {
      queryParameters["creators"] = creators.joinDescriptionsWithSeparator(",")
    }
    if let characters = self.characters {
      queryParameters["characters"] = characters.joinDescriptionsWithSeparator(",")
    }
    if let seriesType = self.seriesType {
      queryParameters["seriesType"] = seriesType.rawValue
    }
    if let contains = self.contains {
      queryParameters["contains"] = contains.joinDescriptionsWithSeparator(",")
    }
    if let orderBy = self.orderBy {
      queryParameters["orderBy"] = orderBy.joinDescriptionsWithSeparator(",")
    }
    
    return queryParameters
  }
}

public enum SeriesType: String {
  case Collection = "collection"
  case OneShot = "one shot"
  case Limited = "limited"
  case Ongoing = "ongoing"
}

public enum SeriesOrder: String, CustomStringConvertible {
  case Title = "title"
  case StartYear = "startYear"
  case Modified = "modified"
  case TitleDescending = "-title"
  case StartYearDescending = "-startYear"
  case ModifiedDescending = "-modified"
  
  public var description: String {
    return self.rawValue
  }
}
