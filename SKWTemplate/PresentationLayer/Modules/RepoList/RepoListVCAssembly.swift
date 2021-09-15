//
//  RepoListVCAssembly.swift
//  SKWTemplate
//
//  Created by Алексей Макаров on 15.09.2021.
//

import Foundation

final class RepoListVCAssembly {
  class func createModule() -> RepoListVC {
    let reactor: RepoListVCReactor = MainCoordinator.shared.container.resolve()
    let module = RepoListVC()
    module.reactor = reactor
    let router = RepoListRouter(view: module)
    module.handler = MainCoordinator.shared.container.resolve()
    module.handler.bind(view: module, router: router)
    return module
  }
}
