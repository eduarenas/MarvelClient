//
//  DictionaryUtils.swift
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
