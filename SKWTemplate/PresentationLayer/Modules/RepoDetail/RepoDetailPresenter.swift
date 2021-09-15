//
//  RepoDetailPresenter.swift
//  SKWTemplate
//
//  Created by Алексей Макаров on 15.09.2021.
//

import UIKit
import DITranquillity

final class RepoDetailPart: DIPart {
  static func load(container: DIContainer) {
    container.register(RepoDetailPresenter.init)
      .as(RepoDetailEventHandler.self)
      .lifetime(.objectGraph)
  }
}

final class RepoDetailPresenter: RepoDetailEventHandler {
  
  func bind(view: UIViewController, router: RepoDetailRoutable, data: RepoModel) {
    let view = view as? RepoDetail
    view?.repo = data
  }
}
