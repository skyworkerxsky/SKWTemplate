//
//  RepoDetailAssembly.swift
//  SKWTemplate
//
//  Created by Алексей Макаров on 15.09.2021.
//

import Foundation

// MARK: - Assembly

final class RepoDetailAssembly {
  class func createModule(repo: RepoModel, parent: Router?) -> RepoDetail {
    let reactor: RepoDetailReactor = MainCoordinator.shared.container.resolve()
    let module = RepoDetail()
    module.reactor = reactor
    let router = RepoDetailRouter(view: module, parent: parent)
    module.handler = MainCoordinator.shared.container.resolve()
    module.handler.bind(view: module, router: router, data: repo)
    
    return module
  }
}

// MARK: - Route

protocol RepoDetailRoute {
  func openDetail(repo: RepoModel)
}

extension RepoDetailRoute where Self: RouterProtocol {
  func openDetail(repo: RepoModel) {
    let module = RepoDetailAssembly.createModule(repo: repo, parent: self)
    PushRouter(target: module, parent: self.controller).move()
  }
}
