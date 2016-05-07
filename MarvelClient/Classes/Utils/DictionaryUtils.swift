//
//  DictionaryUtils.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/6/16.
//
//

import Foundation

func +<KeyType, ValueType>(lhs: Dictionary<KeyType, ValueType>, rhs: Dictionary<KeyType, ValueType>) -> Dictionary<KeyType, ValueType> {
  var result = lhs;
  for (key, val) in rhs {
    result[key] = val
  }
  return result
}
