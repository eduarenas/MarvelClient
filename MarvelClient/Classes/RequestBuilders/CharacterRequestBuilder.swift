//
//  CharacterRequestBuilder.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/6/16.
//
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
  
  init(privateKey: String, publicKey: String) {
    super.init(entityType: self.entityTypeString, privateKey: privateKey, publicKey: publicKey)
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
  
  public func stories(events: [Int]) -> Self {
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
