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
  
  let id: Int
  let name: String
  let description: String
  let modified: NSDate
  let resourceURI: String
  let urls: [Url]
  let thumbnail: Image
  let comics: ResourceList<ComicSummary>
  let stories: ResourceList<StorySummary>
  let events: ResourceList<EventSummary>
  let series: ResourceList<SeriesSummary>
  
  init(json: JSON) {
    self.id = json["id"].int!
    self.name = json["name"].string!
    self.description = json["name"].string!
    self.modified = json["modified"].date!
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
  
  let resourceURI: String
  let name: String
  let role: String
  
  init(json: JSON) {
    self.resourceURI = json["resourceURI"].string!
    self.name = json["name"].string!
    self.role = json["role"].string!
  }
}
