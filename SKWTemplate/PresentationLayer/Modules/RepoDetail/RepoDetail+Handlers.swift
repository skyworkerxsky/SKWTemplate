//
//  RepoDetail+Handlers.swift
//  SKWTemplate
//
//  Created by Алексей Макаров on 17.09.2021.
//

import UIKit

extension RepoDetail {
  @objc func share() {
    guard let repoUrl = reactor?.currentState.repo.url,
          let url = URL(string: repoUrl) else { return }
    let shareItems = [url]
    let avc = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
    present(avc, animated: true, completion: nil)
  }
}
