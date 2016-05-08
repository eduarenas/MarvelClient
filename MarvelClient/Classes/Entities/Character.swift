//
//  Character.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation
import SwiftyJSON

public struct Character: Entity {
  
  public let id: Int
  public let name: String
  public let characterDescription: String
  public let modified: NSDate?
  public let resourceURI: String
  public let urls: [Url]
  public let thumbnail: Image
  public let comics: ResourceList<ComicSummary>
  public let stories: ResourceList<StorySummary>
  public let events: ResourceList<EventSummary>
  public let series: ResourceList<SeriesSummary>
  
  public init(json: JSON) {
    self.id = json["id"].int!
    self.name = json["name"].string!
    self.characterDescription = json["description"].string!
    self.modified = json["modified"].dateTime
    self.resourceURI = json["resourceURI"].string!
    self.urls = json["urls"].array!.map { Url(json: $0) }
    self.thumbnail = Image(json: json["thumbnail"])
    self.comics = ResourceList<ComicSummary>(json: json["comics"])
    self.stories = ResourceList<StorySummary>(json: json["stories"])
    self.events = ResourceList<EventSummary>(json: json["events"])
    self.series = ResourceList<SeriesSummary>(json: json["series"])
  }
}

public struct CharacterSummary: EntitySummary {
  
  public let resourceURI: String
  public let name: String
  public let role: String
  
  public init(json: JSON) {
    self.resourceURI = json["resourceURI"].string!
    self.name = json["name"].string!
    self.role = json["role"].string!
  }
}
