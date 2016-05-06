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
  
  var md5Hash: String {
    let stringData = self.dataUsingEncoding(NSUTF8StringEncoding)!
    return stringData.md5Hash()
  }
}
