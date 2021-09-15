//
//  RepoListVCRouter.swift
//  SKWTemplate
//
//  Created by Алексей Макаров on 15.09.2021.
//

// MARK: - Router

protocol RepoListRoutable: BaseRoutable, RepoDetailRoute {}

class RepoListRouter: BaseRouter, RepoListRoutable {}
