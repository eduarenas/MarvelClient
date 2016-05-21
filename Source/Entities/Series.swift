//
//  Series.swift
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
import SwiftyJSON

public struct Series: Entity {
  
  public let id: Int
  public let title: String
  public let seriesDescription: String
  public let resourceURI: String
  public let urls: [Url]
  public let startYear: Int
  public let endYear: Int
  public let rating: String
  public let modified: NSDate?
  public let thumbnail: Image
  public let comics: ResourceList<ComicSummary>
  public let stories: ResourceList<StorySummary>
  public let events: ResourceList<EventSummary>
  public let characters: ResourceList<CharacterSummary>
  public let creators: ResourceList<CreatorSummary>
  public let next: SeriesSummary?
  public let previous: SeriesSummary?
  
  public init(json: JSON) {
    self.id = json["id"].int!
    self.title = json["title"].string!
    self.seriesDescription = json["description"].string!
    self.resourceURI = json["resourceURI"].string!
    self.urls = json["urls"].array!.map { Url(json: $0) }
    self.startYear = json["startYear"].int!
    self.endYear = json["endYear"].int!
    self.rating = json["rating"].string!
    self.modified = json["modified"].dateTime
    self.thumbnail = Image(json: json["thumbnail"])
    self.comics = ResourceList<ComicSummary>(json: json["comics"])
    self.stories = ResourceList<StorySummary>(json: json["stories"])
    self.events = ResourceList<EventSummary>(json: json["series"])
    self.characters = ResourceList<CharacterSummary>(json: json["characters"])
    self.creators = ResourceList<CreatorSummary>(json: json["creators"])
    self.next = json["next"].type != .Null ? SeriesSummary(json: json["next"]) : nil
    self.previous = json["previous"].type != .Null ? SeriesSummary(json: json["previous"]) : nil
  }
}

public struct SeriesSummary: EntitySummary {
  
  public let resourceURI: String
  public let name: String
  
  public init(json: JSON) {
    self.resourceURI = json["resourceURI"].string!
    self.name = json["name"].string!
  }
}
