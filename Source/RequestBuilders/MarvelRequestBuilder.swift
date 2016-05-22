//
//  RequestBuilder.swift
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
import Alamofire
import SwiftyJSON

public typealias MarvelResultsFilter = (entityTipe: EntityType, id: Int)

public class MarvelRequestBuilder {
  
  private let baseEndpoint = "https://gateway.marvel.com/v1/public/"
  private let keys: MarvelAPIKeys
  private var entityId: Int?
  
  public let entityType: String
  public var resultsFilter: MarvelResultsFilter?
  public var modifiedSince: NSDate?
  public var resultsLimit: Int?
  public var resultsOffset: Int?
  
  var request: Request {
    return Alamofire.request(.GET, self.url, parameters: self.parameters, encoding: .URL)
  }
  
  var parameters: [String: AnyObject] {
    return buildAuthenticationParameters() + buildQueryParameters()
  }
  
  var url: String {
    if let filter = self.resultsFilter {
      return "\(self.baseEndpoint)\(filter.entityTipe.rawValue)/\(filter.id)/\(self.entityType)"
    } else if let id = self.entityId {
      return "\(self.baseEndpoint)\(self.entityType)/\(id)"
    } else {
      return "\(self.baseEndpoint)\(self.entityType)"
    }
  }
  
  init(entityType: String, keys: MarvelAPIKeys) {
    self.entityType = entityType
    self.keys = keys
  }
  
  public func modifiedSince(modifiedSince: NSDate) -> Self {
    self.modifiedSince = modifiedSince
    return self
  }
  
  public func filter(resultsFilter: MarvelResultsFilter) -> Self {
    self.resultsFilter = resultsFilter
    return self
  }
  
  public func limit(resultsLimit: Int) -> Self {
    self.resultsLimit = resultsLimit
    return self
  }
  
  public func offset(resultsOffset: Int) -> Self {
    self.resultsOffset = resultsOffset
    return self
  }
  
  func fetchResults<T: Entity>(completionHandler: Wrapper<T> -> Void) {
    self.request.responseJSON { (response) in
      switch response.result {
      case .Success:
        if let value = response.result.value {
          let result = Wrapper<T>(json: JSON(value))
          completionHandler(result)
        }
      case .Failure(let error):
        print(error)
      }
    }
  }
  
  func fetchResultById<T: Entity>(id: Int, completionHandler: Wrapper<T> -> Void) {
    self.entityId = id
    fetchResults(completionHandler)
  }
  
  func buildQueryParameters() -> [String: AnyObject] {
    var queryParameters = [String: AnyObject]()
    
    if let modifiedSince = self.modifiedSince {
      queryParameters["modifiedSince"] = modifiedSince.marvelDateTimeString
    }
    if let limit = self.resultsLimit {
      queryParameters["limit"] = limit
    }
    if let offset = self.resultsOffset {
      queryParameters["offset"] = offset
    }
    
    return queryParameters
  }
  
  private func buildAuthenticationParameters() -> [String: String] {
    let timestamp = NSDate().timeIntervalSince1970
    let requestHash = "\(timestamp)\(self.keys.privateKey)\(self.keys.publicKey)".md5Hash
    return ["ts": "\(timestamp)",
            "apikey": self.keys.publicKey,
            "hash": requestHash]
    
  }
}

public struct DateRange: CustomStringConvertible {
  
  let startDate: NSDate
  let endDate: NSDate
  
  public var description: String {
    return "\(self.startDate.marvelDateString),\(self.endDate.marvelDateString)"
  }
}
