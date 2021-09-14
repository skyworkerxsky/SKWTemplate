//
//  RepositoryService.swift
//  SKWTemplate
//
//  Created by Алексей Макаров on 10.08.2021.
//

import Foundation
import RxSwift
import Moya
import RxMoya
import DITranquillity

class RepoServicePart: DIPart {
  static func load(container: DIContainer) {
    container.register(RepositoryServiceImplementation.init)
      .as(RepositoryService.self)
      .injection(cycle: true, { $0.provider = $1 })
      .lifetime(.single)
    
    container
      .register { MoyaProvider<RepositoryRequest>() }
      .lifetime(.objectGraph)
  }
}

protocol RepositoryService {
  func fetchRepositories() -> Observable<[RepoModel]>
}

final class RepositoryServiceImplementation: RepositoryService {
  
  var provider: MoyaProvider<RepositoryRequest>
  
  init(provider: MoyaProvider<RepositoryRequest>) {
    self.provider = provider
  }
  
  func fetchRepositories() -> Observable<[RepoModel]> {
    provider
      .rx
      .request(.repositories)
      .filterSuccess()
      .map(RepoResponseModel.self, failsOnEmptyData: false)
      .map { $0.items }
      .asObservable()
  } 
}
