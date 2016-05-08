//
//  SeriesRequestBuilder.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/8/16.
//
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
  
  init(privateKey: String, publicKey: String) {
    super.init(entityType: self.entityTypeString, privateKey: privateKey, publicKey: publicKey)
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
    if let orderBy = self.orderBy {
      queryParameters["orderBy"] = orderBy.joinDescriptionsWithSeparator(",")
    }
    
    return queryParameters
  }
}

public enum SeriesType: String {
  case Comic = "comic"
  case Magazine = "magazine"
  case TradePaperback = "trade paperback"
  case Hardcover = "hardcover"
  case Digest = "digest"
  case GraphicNovel = "graphic novel"
  case DigitalComic = "digital comic"
  case InfiniteComic = "infinite comic"
}

public enum SeriesOrder: String, CustomStringConvertible {
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
