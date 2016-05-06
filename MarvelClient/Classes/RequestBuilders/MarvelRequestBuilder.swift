//
//  RequestBuilder.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/6/16.
//
//

import Foundation
import Alamofire

class MarvelRequestBuilder {
  
  var request {
    let url = urlForEntityType(entityType, filter: filter)
    let parameters = buildAuthenticationParameters()
    return Alamofire.request(.GET, url, parameters: parameters, encoding: .URL)
  }
  
  private let baseEndpoint = "https://gateway.marvel.com/v1/public/"
  private let privateKey: String
  private let publicKey: String
  
  let entityType: String
  
  init(privateKey: String, publicKey: String) {
    self.privateKey = privateKey
    self.publicKey = publicKey
  }
  
  private func urlForEntityType(entityType: String, filter requestFilter: (entityTipe: String, id: String)?) -> String {
    if let filter = requestFilter {
      return "\(self.baseEndpoint)\(filter.0)/\(filter.1)/\(entityType)"
    } else {
      return "\(self.baseEndpoint)\(entityType)"
    }
  }
  
  private func buildAuthenticationParameters() -> [String: String] {
    let timestamp = NSDate().timeIntervalSince1970
    let requestHash = "\(timestamp)\(self.privateKey)\(self.publicKey)".md5Hash
    return ["ts": "\(timestamp)",
            "apikey": self.publicKey,
            "hash": requestHash]
    
  }
}

