//
//  RepoError.swift
//  SKWTemplate
//
//  Created by Алексей Макаров on 14.09.2021.
//

import Foundation

public struct RepoError: Hashable {
  let message: String
  let isError: Bool
  
  init(message: String? = nil,
       isError: Bool? = nil) {
    self.message = message ?? ""
    self.isError = isError ?? false
  }
}
