//
//  PropertyListLoader.swift
//  MarvelClient
//
//  Created by Eduardo Arenas on 5/7/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation

class PropertyListLoader {
  
  private let fileName: String
  var dictionaryRepresentation: [String: AnyObject]?
  var arrayRepresentation: [AnyObject]?
  
  init(fileName: String) {
    self.fileName = fileName
    loadPropertyListFile()
  }
  
  private func loadPropertyListFile() {
    if let path = NSBundle.mainBundle().pathForResource(self.fileName, ofType: "plist") {
      if let dictionary = NSDictionary(contentsOfFile: path) {
        self.dictionaryRepresentation = dictionary as? [String : AnyObject]
      }
      if let array = NSArray(contentsOfFile: path) {
        self.arrayRepresentation = array as [AnyObject]
      }
    }
  }
}
