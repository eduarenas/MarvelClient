//
//  DictionaryUtils.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/6/16.
//
//

import Foundation

/**
 Merge two dictionaries using the + operator. The result is a new dictionary that
 contains all the keys and values of both the left hand side dictionary and the right
 hand side dictionary.
 
 If there is a key present on both dictionaries the right hand side's value will be the one
 present in the returned value
 
 - parameter lhs: Left hand side dictionary
 - parameter rhs: Right hand side dictionary
 - returns: Dictionary that contains all the keys and values from `lhs` and `rhs`
 */
func +<KeyType, ValueType>(lhs: Dictionary<KeyType, ValueType>, rhs: Dictionary<KeyType, ValueType>) -> Dictionary<KeyType, ValueType> {
  var result = lhs;
  for (key, val) in rhs {
    result[key] = val
  }
  return result
}
