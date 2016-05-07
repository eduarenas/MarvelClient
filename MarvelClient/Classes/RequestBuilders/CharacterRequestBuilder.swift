//
//  CharacterRequestBuilder.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/6/16.
//
//

import Foundation
import SwiftyJSON

public class CharacterRequestBuilder: MarvelRequestBuilder {
  
  private let entityTypeString = "characters"
  
  init(privateKey: String, publicKey: String) {
    super.init(entityType: self.entityTypeString, privateKey: privateKey, publicKey: publicKey)
  }

  public func fetch() {
    self.request.responseJSON { (response) in
      switch response.result {
      case .Success:
        if let value = response.result.value {
          let json = JSON(value)
          print("JSON: \(json)")
        }
      case .Failure(let error):
        print(error)
      }
    }
  }
}
