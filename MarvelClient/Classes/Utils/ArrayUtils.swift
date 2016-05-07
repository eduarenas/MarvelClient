//
//  ArrayUtils.swift
//  Pods
//
//  Created by Eduardo Arenas on 5/7/16.
//
//

import Foundation

extension SequenceType where Generator.Element: CustomStringConvertible {
  /// Interpose the `separator` between descriptions of elements of `self`, then concatenate
  /// the result.  For example:
  ///
  ///     [1, 2, 3].joinWithSeparator("-|-") // "1-|-2-|-3"
  @warn_unused_result
  func joinDescriptionsWithSeparator(separator: String) -> String {
    let descriptionsArray = self.map { $0.description }
    return descriptionsArray.joinWithSeparator(separator)
  }
}
