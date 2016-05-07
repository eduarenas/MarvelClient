//
//  RequestBuilder.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/6/16.
//
//

import Foundation
import Alamofire
import SwiftyJSON

public typealias MarvelResultsFilter = (entityTipe: String, id: String)

public class MarvelRequestBuilder {
  
  private let baseEndpoint = "https://gateway.marvel.com/v1/public/"
  private let privateKey: String
  private let publicKey: String
  
  public let entityType: String
  public var resultsFilter: MarvelResultsFilter?
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
      return "\(self.baseEndpoint)\(filter.entityTipe)/\(filter.id)/\(self.entityType)"
    } else {
      return "\(self.baseEndpoint)\(self.entityType)"
    }
  }
  
  init(entityType: String, privateKey: String, publicKey: String) {
    self.entityType = entityType
    self.privateKey = privateKey
    self.publicKey = publicKey
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
  
  func buildQueryParameters() -> [String: String] {
    var queryParameters = [String: String]()
    
    if let limit = self.resultsLimit {
      queryParameters["limit"] = String(limit)
    }
    if let offset = self.resultsOffset {
      queryParameters["offset"] = String(offset)
    }
    
    return queryParameters
  }
  
  private func buildAuthenticationParameters() -> [String: String] {
    let timestamp = NSDate().timeIntervalSince1970
    let requestHash = "\(timestamp)\(self.privateKey)\(self.publicKey)".md5Hash
    return ["ts": "\(timestamp)",
            "apikey": self.publicKey,
            "hash": requestHash]
    
  }
}
