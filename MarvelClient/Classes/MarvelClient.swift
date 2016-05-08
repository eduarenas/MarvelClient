//
//  MarvelClient.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/6/16.
//
//

import Foundation
import Alamofire

public class MarvelClient {
  
  // TODO: pack this on a Tuple or Struct
  let privateKey: String
  let publicKey: String
  
  public init(privateKey: String, publicKey: String) {
    self.privateKey = privateKey
    self.publicKey = publicKey
  }
  
  public func requestCharacters() -> CharacterRequestBuilder {
    return CharacterRequestBuilder(privateKey: self.privateKey, publicKey: self.publicKey)
  }
  
  public func requestComics() -> ComicRequestBuilder {
    return ComicRequestBuilder(privateKey: self.privateKey, publicKey: self.publicKey)
  }
  
  public func requestCreators() -> CreatorRequestBuilder {
    return CreatorRequestBuilder(privateKey: self.privateKey, publicKey: self.publicKey)
  }
  
  public func requestEvents() -> EventRequestBuilder {
    return EventRequestBuilder(privateKey: self.privateKey, publicKey: self.publicKey)
  }
  
  public func requestSeries() -> SeriesRequestBuilder {
    return SeriesRequestBuilder(privateKey: self.privateKey, publicKey: self.publicKey)
  }
}
