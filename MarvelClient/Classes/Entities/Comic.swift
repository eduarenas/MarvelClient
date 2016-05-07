//
//  Comic.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation
import SwiftyJSON

public struct Comic: Entity {

  public let id: Int
  public let digitalId: Int
  public let title: String
  public let issueNumber: Int
  public let variantDescription: String
  public let modified: NSDate?
  public let isbn: String
  public let upc: String
  public let diamondCode: String
  public let ean: String
  public let issn: String
  public let format: String
  public let pageCount: Int
  public let textObjects: [TextObject]
  public let resourceURI: String
  public let urls: [Url]
  public let series: SeriesSummary
  public let variants: [ComicSummary]
  public let collections: [ComicSummary]
  public let collectedIssues: [ComicSummary]
  public let dates: [ComicDate]
  public let prices: [ComicPrice]
  public let thumbnail: Image
  public let images: [Image]
  public let creators: ResourceList<CreatorSummary>
  public let characters: ResourceList<CharacterSummary>
  public let stories: ResourceList<StorySummary>
  public let events: ResourceList<EventSummary>
  
  public init(json: JSON) {
    self.id = json["id"].int!
    self.digitalId = json["digitalId"].int!
    self.title = json["title"].string!
    self.issueNumber = json["issueNumber"].int!
    self.variantDescription = json["variantDescription"].string!
    self.modified = json["modified"].dateTime
    self.isbn = json["isbn"].string!
    self.upc = json["upc"].string!
    self.diamondCode = json["diamondCode"].string!
    self.ean = json["ean"].string!
    self.issn = json["issn"].string!
    self.format = json["format"].string!
    self.pageCount = json["pageCount"].int!
    self.textObjects = json["textObjects"].array!.map { TextObject(json: $0) }
    self.resourceURI = json["resourceURI"].string!
    self.urls = json["urls"].array!.map { Url(json: $0) }
    self.series = SeriesSummary(json: json["series"])
    self.variants = json["variants"].array!.map { ComicSummary(json: $0) }
    self.collections = json["collections"].array!.map { ComicSummary(json: $0) }
    self.collectedIssues = json["collectedIssues"].array!.map { ComicSummary(json: $0) }
    self.dates = json["dates"].array!.map { ComicDate(json: $0) }
    self.prices = json["prices"].array!.map { ComicPrice(json: $0) }
    self.thumbnail = Image(json: json["thumbnail"])
    self.images = json["images"].array!.map { Image(json: $0) }
    self.creators = ResourceList<CreatorSummary>(json: json["creators"])
    self.characters = ResourceList<CharacterSummary>(json: json["characters"])
    self.stories = ResourceList<StorySummary>(json: json["stories"])
    self.events = ResourceList<EventSummary>(json: json["events"])
  }
}

public struct ComicSummary: EntitySummary {
  
  public let resourceURI: String
  public let name: String
  
  public init(json: JSON) {
    self.resourceURI = json["resourceURI"].string!
    self.name = json["name"].string!
  }
}

public struct ComicDate: JSONSerializable {
  
  let type: String
  let date: NSDate?
  
  public init(json: JSON) {
    self.type = json["type"].string!
    self.date = json["date"].dateTime
  }
}

public struct ComicPrice: JSONSerializable {
  
  let type: String
  let price: Double
  
  public init(json: JSON) {
    self.type = json["type"].string!
    self.price = json["price"].double!
  }
}
