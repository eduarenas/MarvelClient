//
//  ComicRequestBuilder.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation

public class ComicRequestBuilder: MarvelRequestBuilder {
  
  private let entityTypeString = "comics"
  
  public var format: ComicFormat?
  public var formatType: ComicFormatType?
  public var noVariants: Bool?
  public var dateDescriptor: ComicDateDescriptor?
  public var dateRange: DateRange?
  public var title: String?
  public var titleStartsWith: String?
  public var startYear: Int?
  public var issueNumber: Int?
  public var diamondCode: String?
  public var digitalId: Int?
  public var upc: String?
  public var isbn: String?
  public var ean: String?
  public var issn: String?
  public var hasDigitalIssue: Bool?
  public var creators: [Int]?
  public var characters: [Int]?
  public var series: [Int]?
  public var events: [Int]?
  public var stories: [Int]?
  public var sharedAppearances: [Int]?
  public var collaborators: [Int]?
  public var orderBy: ComicOrder?
  
  init(privateKey: String, publicKey: String) {
    super.init(entityType: self.entityTypeString, privateKey: privateKey, publicKey: publicKey)
  }
  
  public func fetch(completionHandler: Wrapper<Comic> -> Void) {
    super.fetchResults(completionHandler)
  }
  
  public func format(format: ComicFormat) -> Self {
    self.format = format
    return self
  }

  public func formatType(formatType: ComicFormatType) -> Self {
    self.formatType = formatType
    return self
  }

  public func noVariants(noVariants: Bool) -> Self {
    self.noVariants = noVariants
    return self
  }

  public func dateDescriptor(dateDescriptor: ComicDateDescriptor) -> Self {
    self.dateDescriptor = dateDescriptor
    return self
  }

  public func dateRange(dateRange: DateRange) -> Self {
    self.dateRange = dateRange
    return self
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

  public func issueNumber(issueNumber: Int) -> Self {
    self.issueNumber = issueNumber
    return self
  }

  public func diamondCode(diamondCode: String) -> Self {
    self.diamondCode = diamondCode
    return self
  }

  public func digitalId(digitalId: Int) -> Self {
    self.digitalId = digitalId
    return self
  }
  
  public func upc(upc: String) -> Self {
    self.upc = upc
    return self
  }

  public func isbn(isbn: String) -> Self {
    self.isbn = isbn
    return self
  }

  public func ean(ean: String) -> Self {
    self.ean = ean
    return self
  }

  public func issn(issn: String) -> Self {
    self.issn = issn
    return self
  }

  public func hasDigitalIssue(hasDigitalIssue: Bool) -> Self {
    self.hasDigitalIssue = hasDigitalIssue
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

  public func series(series: [Int]) -> Self {
    self.series = series
    return self
  }

  public func events(events: [Int]) -> Self {
    self.events = events
    return self
  }

  public func stories(stories: [Int]) -> Self {
    self.stories = stories
    return self
  }

  public func sharedAppearances(sharedAppearances: [Int]) -> Self {
    self.sharedAppearances = sharedAppearances
    return self
  }

  public func collaborators(collaborators: [Int]) -> Self {
    self.collaborators = collaborators
    return self
  }

  public func orderBy(orderBy: ComicOrder) -> Self {
    self.orderBy = orderBy
    return self
  }

  override func buildQueryParameters() -> [String : AnyObject] {
    var queryParameters = super.buildQueryParameters()
    
    if let format = self.format {
      queryParameters["format"] = format.rawValue
    }
    if let formatType = self.formatType {
      queryParameters["formatType"] = formatType.rawValue
    }
    if let noVariants = self.noVariants {
      queryParameters["noVariants"] = noVariants
    }
    if let dateDescriptor = self.dateDescriptor {
      queryParameters["dateDescriptor"] = dateDescriptor.rawValue
    }
    if let dateRange = self.dateRange {
      queryParameters["dateRange"] = dateRange.description
    }
    if let title = self.title {
      queryParameters["title"] = title
    }
    if let titleStartsWith = self.titleStartsWith {
      queryParameters["titleStartsWith"] = titleStartsWith
    }
    if let startYear = self.startYear {
      queryParameters["startYear"] = startYear
    }
    if let issueNumber = self.issueNumber {
      queryParameters["issueNumber"] = issueNumber
    }
    if let diamondCode = self.diamondCode {
      queryParameters["diamondCode"] = diamondCode
    }
    if let digitalId = self.digitalId {
      queryParameters["digitalId"] = digitalId
    }
    if let upc = self.upc {
      queryParameters["upc"] = upc
    }
    if let isbn = self.isbn {
      queryParameters["isbn"] = isbn
    }
    if let ean = self.ean {
      queryParameters["ean"] = ean
    }
    if let issn = self.issn {
      queryParameters["issn"] = issn
    }
    if let hasDigitalIssue = self.hasDigitalIssue {
      queryParameters["hasDigitalIssue"] = hasDigitalIssue
    }
    if let creators = self.creators {
      queryParameters["creators"] = creators.joinDescriptionsWithSeparator(",")
    }
    if let characters = self.characters {
      queryParameters["characters"] = characters.joinDescriptionsWithSeparator(",")
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
    if let sharedAppearances = self.sharedAppearances {
      queryParameters["sharedAppearances"] = sharedAppearances.joinDescriptionsWithSeparator(",")
    }
    if let collaborators = self.collaborators {
      queryParameters["collaborators"] = collaborators.joinDescriptionsWithSeparator(",")
    }
    if let orderBy = self.orderBy {
      queryParameters["orderBy"] = orderBy.rawValue
    }

    return queryParameters
  }
}

public enum ComicFormat: String {
  case Comic = "comic"
  case Magazine = "magazine"
  case TradePaperback = "trade paperback"
  case Hardcover = "hardcover"
  case Digest = "digest"
  case GraphicNovel = "graphic novel"
  case DigitalComic = "digital comic"
  case InfiniteComic = "infinite comic"
}

public enum ComicFormatType: String {
  case Comic = "comic"
  case Collection = "collection"
}

public enum ComicDateDescriptor: String {
  case LastWeek = "lastWeek"
  case ThisWeek = "thisWeek"
  case NextWeek = "nextWeek"
  case ThisMonth = "thisMonth"
}

public enum ComicOrder: String, CustomStringConvertible {
  case FocDate = "focDate"
  case OnsaleDate = "onsaleDate"
  case Title = "title"
  case IssueNumber = "issueNumber"
  case Modified = "modified"
  case FocDateDescending = "-focDate"
  case OnsaleDateDescending = "-onsaleDate"
  case TitleDescending = "-title"
  case IssueNumberDescending = "-issueNumber"
  case ModifiedDescending = "-modified"
  
  public var description: String {
    return self.rawValue
  }
}
