//
//  MarvelClient.swift
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

typealias MarvelAPIKeys = (privateKey: String, publicKey: String)

public class MarvelClient {
  
  let keys: MarvelAPIKeys
  
  public init(privateKey: String, publicKey: String) {
    self.keys = (privateKey, publicKey)
  }
  
  public func requestCharacter(id: Int, completionHandler: Wrapper<Character> -> Void) {
    CharacterRequestBuilder(keys: self.keys).fetchResultById(id, completionHandler: completionHandler)
  }
  
  public func requestCharacters() -> CharacterRequestBuilder {
    return CharacterRequestBuilder(keys: self.keys)
  }
  
  public func requestComic(id: Int, completionHandler: Wrapper<Comic> -> Void) {
    ComicRequestBuilder(keys: self.keys).fetchResultById(id, completionHandler: completionHandler)
  }
  
  public func requestComics() -> ComicRequestBuilder {
    return ComicRequestBuilder(keys: self.keys)
  }
  
  public func requestCreator(id: Int, completionHandler: Wrapper<Creator> -> Void) {
    CreatorRequestBuilder(keys: self.keys).fetchResultById(id, completionHandler: completionHandler)
  }
  
  public func requestCreators() -> CreatorRequestBuilder {
    return CreatorRequestBuilder(keys: self.keys)
  }
  
  public func requestEvent(id: Int, completionHandler: Wrapper<Event> -> Void) {
    EventRequestBuilder(keys: self.keys).fetchResultById(id, completionHandler: completionHandler)
  }
  
  public func requestEvents() -> EventRequestBuilder {
    return EventRequestBuilder(keys: self.keys)
  }
  
  public func requestSeries(id: Int, completionHandler: Wrapper<Series> -> Void) {
    SeriesRequestBuilder(keys: self.keys).fetchResultById(id, completionHandler: completionHandler)
  }
  
  public func requestSeries() -> SeriesRequestBuilder {
    return SeriesRequestBuilder(keys: self.keys)
  }
  
  public func requestStory(id: Int, completionHandler: Wrapper<Story> -> Void) {
    StoryRequestBuilder(keys: self.keys).fetchResultById(id, completionHandler: completionHandler)
  }
  
  public func requestStories() -> StoryRequestBuilder {
    return StoryRequestBuilder(keys: self.keys)
  }
}
