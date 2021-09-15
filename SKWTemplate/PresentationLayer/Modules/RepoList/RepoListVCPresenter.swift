//
//  RepoListVCPresenter.swift
//  SKWTemplate
//
//  Created by Алексей Макаров on 15.09.2021.
//

import UIKit
import DITranquillity

final class RepoListPart: DIPart {
  static func load(container: DIContainer) {
    container.register(RepoListPresenter.init)
      .as(RepoListEventHandler.self)
      .lifetime(.objectGraph)
  }
}

final class RepoListPresenter: RepoListEventHandler {
  
  func bind(view: UIViewController, router: RepoListRoutable) {
    let view = view as? RepoListVC
    view?.router = router
  }
}
