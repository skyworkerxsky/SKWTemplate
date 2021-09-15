//
//  DependenciesConfiguration.swift
//  SKWTemplate
//
//  Created by Алексей Макаров on 14.09.2021.
//

import UIKit
import DITranquillity

public protocol DependenciesConfiguration: AnyObject {
  func configuredContainer() -> DIContainer
}

class DependenciesConfigurationBase: DependenciesConfiguration {
  private var options: [UIApplication.LaunchOptionsKey: Any]?

  init(launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
    self.options = launchOptions
  }
  
  public func configuredContainer() -> DIContainer {
    let container = DIContainer()
    container.append(framework: AppPart.self)
    return container
  }
}
