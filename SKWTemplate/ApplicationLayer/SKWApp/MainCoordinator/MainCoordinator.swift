//
//  MainCoordinator.swift
//  SKWTemplate
//
//  Created by Алексей Макаров on 14.09.2021.
//

import UIKit
import DITranquillity

open class MainCoordinator: Coordinator {
  var navigationController: UINavigationController?
  
  public static var shared: MainCoordinator!
  
  open var configuration: DependenciesConfiguration
  open var container: DIContainer
  
  private var router: AppRouter!
  
  init(configuration: DependenciesConfiguration) {
      self.configuration = configuration
      self.container = self.configuration.configuredContainer()
      self.router = AppRouter()
  }
  
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
    router.openDefaultScene()
  }
  
  private func openRepoDetail() {
    let vc = RepoDetail()
    vc.coordinator = self
    
    navigationController?.pushViewController(vc, animated: true)
  }
  
}
