//
//  MainCoordinator.swift
//  SKWTemplate
//
//  Created by Алексей Макаров on 14.09.2021.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
  var navigationController: UINavigationController?
  
  func eventOccured(with type: Event) {
    switch type {
    case .openDetail:
      openRepoDetail()
    }
  }
  
  func start() {
    openRepoList()
  }
  
  private func openRepoList() {
    let reactor: RepoListVCReactor = ContainerDI.container.resolve()
    
    let vc = RepoListVC()
    vc.reactor = reactor
    vc.coordinator = self
    
    navigationController?.setViewControllers([vc], animated: false)
  }
  
  private func openRepoDetail() {
    let vc = RepoDetail()
    vc.coordinator = self
    
    navigationController?.pushViewController(vc, animated: true)
  }
  
}
