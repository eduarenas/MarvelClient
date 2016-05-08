//
//  Creator.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation
import SwiftyJSON

public struct Creator: Entity {
  
  public let id: Int
  public let firstName: String
  public let middleName: String
  public let lastName: String
  public let suffix: String
  public let fullName: String
  public let modified: NSDate?
  public let resourceURI: String
  public let urls: [Url]
  public let thumbnail: Image
  public let series: ResourceList<SeriesSummary>
  public let stories: ResourceList<StorySummary>
  public let comics: ResourceList<ComicSummary>
  public let events: ResourceList<EventSummary>

  
  public init(json: JSON) {
    self.id = json["id"].int!
    self.firstName = json["firstName"].string!
    self.middleName = json["middleName"].string!
    self.lastName = json["lastName"].string!
    self.suffix = json["suffix"].string!
    self.fullName = json["fullName"].string!
    self.modified = json["modified"].dateTime
    self.resourceURI = json["resourceURI"].string!
    self.urls = json["urls"].array!.map { Url(json: $0) }
    self.thumbnail = Image(json: json["thumbnail"])
    self.series = ResourceList<SeriesSummary>(json: json["series"])
    self.stories = ResourceList<StorySummary>(json: json["stories"])
    self.comics = ResourceList<ComicSummary>(json: json["comics"])
    self.events = ResourceList<EventSummary>(json: json["events"])
  }
}

public struct CreatorSummary: EntitySummary {
  
  public let resourceURI: String
  public let name: String
  
  public init(json: JSON) {
    self.resourceURI = json["resourceURI"].string!
    self.name = json["name"].string!
  }
}

