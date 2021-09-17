//
//  RepoListVC+Binders.swift
//  SKWTemplate
//
//  Created by Алексей Макаров on 17.09.2021.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: RepoListVC {
  public var scrollLoad: Binder<UnsafeMutablePointer<CGPoint>> {
    
    Binder(base) { repoListVC, targetContentOffset in
      guard let page = repoListVC.reactor?.currentState.page,
            let pages = repoListVC.reactor?.currentState.pages else { return }
      
      let distance = repoListVC.tableView.contentSize.height - (targetContentOffset.pointee.y + repoListVC.tableView.bounds.height)
      
      if distance < 100, page < pages {
        repoListVC.reactor?.action.onNext(.fetchRepos(page: page + 1))
      }
    }
    
  }
}
