//
//  Story.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation
import SwiftyJSON

public struct Story: Entity {
  
  public let id: Int
  public let title: String
  public let storyDescription: String
  public let resourceURI: String
  public let type: String
  public let modified: NSDate?
  public let thumbnail: Image
  public let comics: ResourceList<ComicSummary>
  public let stories: ResourceList<StorySummary>
  public let events: ResourceList<EventSummary>
  public let characters: ResourceList<CharacterSummary>
  public let creators: ResourceList<CreatorSummary>
  public let originalIssue: ComicSummary?
  
  public init(json: JSON) {
    self.id = json["id"].int!
    self.title = json["title"].string!
    self.storyDescription = json["description"].string!
    self.resourceURI = json["resourceURI"].string!
    self.type = json["type"].string!
    self.modified = json["modified"].dateTime
    self.thumbnail = Image(json: json["thumbnail"])
    self.comics = ResourceList<ComicSummary>(json: json["comics"])
    self.stories = ResourceList<StorySummary>(json: json["stories"])
    self.events = ResourceList<EventSummary>(json: json["series"])
    self.characters = ResourceList<CharacterSummary>(json: json["characters"])
    self.creators = ResourceList<CreatorSummary>(json: json["creators"])
    self.originalIssue = json["originalIssue"].type != .Null ? ComicSummary(json: json["originalIssue"]) : nil
  }
}

public struct StorySummary: EntitySummary {
  
  public let resourceURI: String
  public let name: String
  public let type: String
  
  public init(json: JSON) {
    self.resourceURI = json["resourceURI"].string!
    self.name = json["name"].string!
    self.type = json["type"].string!
  }
}
