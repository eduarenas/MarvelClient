//
//  CharacterRequestBuilder.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/6/16.
//
//

import Foundation

public class CharacterRequestBuilder: MarvelRequestBuilder {
  
  private let entityTypeString = "characters"
  
  init(privateKey: String, publicKey: String) {
    super.init(entityType: self.entityTypeString, privateKey: privateKey, publicKey: publicKey)
  }
}
