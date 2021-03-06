//
//  Character.swift
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
  public let role: String?
  
  public init(json: JSON) {
    self.resourceURI = json["resourceURI"].string!
    self.name = json["name"].string!
    self.role = json["role"].string
  }
}
