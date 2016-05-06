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
  private let requestBuilder: MarvelRequestBuilder
  
  init(privateKey: String, publicKey: String) {
    self.requestBuilder = MarvelRequestBuilder(privateKey: privateKey, publicKey: publicKey)
  }
  

}
