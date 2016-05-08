//
//  Event.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation
import SwiftyJSON

public struct Event: Entity {
 
  public let id: Int
  public let title: String
  public let eventDescription: String
  public let resourceURI: String
  public let urls: [Url]
  public let modified: NSDate?
  public let start: NSDate?
  public let end: NSDate?
  public let thumbnail: Image
  public let comics: ResourceList<ComicSummary>
  public let stories: ResourceList<StorySummary>
  public let series: ResourceList<SeriesSummary>
  public let characters: ResourceList<CharacterSummary>
  public let creators: ResourceList<CreatorSummary>
  public let next: EventSummary?
  public let previous: EventSummary?
  
  public init(json: JSON) {
    self.id = json["id"].int!
    self.title = json["title"].string!
    self.eventDescription = json["description"].string!
    self.resourceURI = json["resourceURI"].string!
    self.urls = json["urls"].array!.map { Url(json: $0) }
    self.modified = json["modified"].dateTime
    self.start = json["start"].dateTime
    self.end = json["end"].dateTime
    self.thumbnail = Image(json: json["thumbnail"])
    self.comics = ResourceList<ComicSummary>(json: json["comics"])
    self.stories = ResourceList<StorySummary>(json: json["stories"])
    self.series = ResourceList<SeriesSummary>(json: json["series"])
    self.characters = ResourceList<CharacterSummary>(json: json["characters"])
    self.creators = ResourceList<CreatorSummary>(json: json["creators"])
    self.next = json["next"].type != .Null ? EventSummary(json: json["next"]) : nil
    self.previous = json["previous"].type != .Null ? EventSummary(json: json["previous"]) : nil
  }
}

public struct EventSummary: EntitySummary {
  
  public let resourceURI: String
  public let name: String
  
  public init(json: JSON) {
    self.resourceURI = json["resourceURI"].string!
    self.name = json["name"].string!
  }
}
