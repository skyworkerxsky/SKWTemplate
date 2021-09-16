//
//  RepoDetail+Binders.swift
//  SKWTemplate
//
//  Created by Алексей Макаров on 16.09.2021.
//

import Foundation
import RxSwift
import RxCocoa

extension Reactive where Base: RepoDetail {
  public var loadRequest: Binder<RepoModel> {
    Binder(base) { detailVC, repo in
      guard let url = URL(string: repo.url) else { return }
      let request = URLRequest(url: url)
      detailVC.webView.load(request)
    }
  }
}
