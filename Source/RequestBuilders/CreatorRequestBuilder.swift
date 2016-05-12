//
//  CreatorRequestBuilder.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/8/16.
//
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
  
  public func stories(events: [Int]) -> Self {
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