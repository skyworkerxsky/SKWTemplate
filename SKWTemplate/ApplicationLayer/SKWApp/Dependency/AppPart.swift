//
//  ApplicationDependency.swift
//  SKWTemplate
//
//  Created by Алексей Макаров on 10.08.2021.
//

import Foundation
import DITranquillity

public class AppPart: DIFramework {
  
  public static func load(container: DIContainer) {
    // registrations will be placed here
    container.append(part: ServicesPart.self)
    container.append(part: ReactorsPart.self)
    container.append(part: PresentersPart.self)
  }
}

private class ServicesPart: DIPart {
  static let parts: [DIPart.Type] = [
    RepoServicePart.self,
  ]
  
  static func load(container: DIContainer) {
    for part in self.parts {
      container.append(part: part)
    }
  }
}

private class ReactorsPart: DIPart {
  static let parts: [DIPart.Type] = [
    ReactorListPart.self,
  ]
  
  static func load(container: DIContainer) {
    for part in self.parts {
      container.append(part: part)
    }
  }
}

private class PresentersPart: DIPart {
  static let parts: [DIPart.Type] = [
    RepoListPart.self,
    RepoDetailPart.self,
  ]
  
  static func load(container: DIContainer) {
    for part in self.parts {
      container.append(part: part)
    }
  }
}
