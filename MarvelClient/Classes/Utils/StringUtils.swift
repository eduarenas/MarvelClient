//
//  StringUtils.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/6/16.
//
//

import Foundation
import MD5

extension String {
  
  /**
   Get an MD5 hash calcualted for the calling string.
   
   - returns: MD5 Hash calculated from the calling string
   */
  var md5Hash: String {
    let stringData = self.dataUsingEncoding(NSUTF8StringEncoding)!
    return stringData.md5Hash()
  }
}
