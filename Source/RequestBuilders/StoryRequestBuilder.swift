//
//  StoryRequestBuilder.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/8/16.
//
//

import Foundation

public class StoryRequestBuilder: MarvelRequestBuilder {
  
  private let entityTypeString = "stories"
  
  public var comics: [Int]?
  public var series: [Int]?
  public var events: [Int]?
  public var creators: [Int]?
  public var characters: [Int]?
  public var orderBy: [SeriesOrder]?
  
  init(keys: MarvelAPIKeys) {
    super.init(entityType: self.entityTypeString, keys: keys)
  }
  
  public func fetch(completionHandler: Wrapper<Story> -> Void) {
    super.fetchResults(completionHandler)
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
  
  public func creators(creators: [Int]) -> Self {
    self.creators = creators
    return self
  }
  
  public func characters(characters: [Int]) -> Self {
    self.characters = characters
    return self
  }
  
  public func orderBy(orderBy: [SeriesOrder]) -> Self {
    self.orderBy = orderBy
    return self
  }
  
  override func buildQueryParameters() -> [String : AnyObject] {
    var queryParameters = super.buildQueryParameters()

    if let comics = self.comics {
      queryParameters["comics"] = comics.joinDescriptionsWithSeparator(",")
    }
    if let series = self.series {
      queryParameters["series"] = series.joinDescriptionsWithSeparator(",")
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
    if let orderBy = self.orderBy {
      queryParameters["orderBy"] = orderBy.joinDescriptionsWithSeparator(",")
    }
    
    return queryParameters
  }
}

public enum StoryOrder: String, CustomStringConvertible {
  case Id = "id"
  case Modified = "modified"
  case IdDescending = "-id"
  case ModifiedDescending = "-modified"
  
  public var description: String {
    return self.rawValue
  }
}

