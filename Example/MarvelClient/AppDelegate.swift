//
//  AppDelegate.swift
//  MarvelClient
//
//  Created by Eduardo Arenas on 05/06/2016.
//  Copyright (c) 2016 Eduardo Arenas. All rights reserved.
//

import UIKit
import MarvelClient

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    let keysDict = PropertyListLoader(fileName: "MarvelKeys").dictionaryRepresentation!
    let marvelClient = MarvelClient(privateKey: keysDict["privateKey"] as! String, publicKey: keysDict["publicKey"] as! String)
    marvelClient.requestCharacters().offset(0).limit(10).comics([43504, 32217]).nameStartsWith("Iron").orderBy([.Name, .ModifiedDescending]).fetch { (result) in
      print(result)
    }
    return true
  }
}

