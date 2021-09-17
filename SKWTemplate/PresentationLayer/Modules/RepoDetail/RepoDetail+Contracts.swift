//
//  RepoDetail+Contracts.swift
//  SKWTemplate
//
//  Created by Алексей Макаров on 17.09.2021.
//

import UIKit

protocol RepoDetailEventHandler: AnyObject {
  func bind(view: UIViewController, router: RepoDetailRoutable, data: RepoModel)
}
