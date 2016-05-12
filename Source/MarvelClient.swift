//
//  MarvelClient.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/6/16.
//
//

import Foundation
import Alamofire

typealias MarvelAPIKeys = (privateKey: String, publicKey: String)

public class MarvelClient {
  
  let keys: MarvelAPIKeys
  
  public init(privateKey: String, publicKey: String) {
    self.keys = (privateKey, publicKey)
  }
  
  public func requestCharacters() -> CharacterRequestBuilder {
    return CharacterRequestBuilder(keys: self.keys)
  }
  
  public func requestComics() -> ComicRequestBuilder {
    return ComicRequestBuilder(keys: self.keys)
  }
  
  public func requestCreators() -> CreatorRequestBuilder {
    return CreatorRequestBuilder(keys: self.keys)
  }
  
  public func requestEvents() -> EventRequestBuilder {
    return EventRequestBuilder(keys: self.keys)
  }
  
  public func requestSeries() -> SeriesRequestBuilder {
    return SeriesRequestBuilder(keys: self.keys)
  }
  
  public func requestStories() -> StoryRequestBuilder {
    return StoryRequestBuilder(keys: self.keys)
  }
}
