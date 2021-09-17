import ReactorKit
import RxCocoa
import RxSwift
import DITranquillity

final class ReactorListPart: DIPart {
  static func load(container: DIContainer) {
    container.register(RepoListVCReactor.init)
      .as(RepoListVCReactor.self)
      .lifetime(.objectGraph)
  }
}

final class RepoListVCReactor: Reactor {
  
  // MARK: - Private
  
  let repoService: RepositoryService
  
  // MARK: - Initial
  
  internal let initialState: RepoListVCReactor.State
  
  // MARK: - Init
  
  init(repoService: RepositoryService) {
    initialState = State()
    
    self.repoService = repoService
  }
  
  // MARK: - State
  
  struct State: Equatable {
    var repositories: [RepoModel] = []
    var isLoading: Bool = false
    var error: RepoError = .init()
    var page: Int = 1
    var pages: Int = 1
  }
  
  // MARK: - Action
  
  enum Action: Equatable {
    case fetchRepos(page: Int = 1)
  }
  
  // MARK: - Mutation
  
  public enum Mutation: Equatable {
    case setRepos([RepoModel] = [], pages: Int)
    case addRepos([RepoModel] = [], pages: Int)
    case setLoading(Bool)
    case setError(RepoError)
  }
  
  // MARK: - Implementation
  
  func transform(action: Observable<Action>) -> Observable<Action> {
    action
      .startWith(.fetchRepos())
  }
  
  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case let .fetchRepos(page):
      let setLoading: Observable<Mutation> = .just(.setLoading(page == 1))
      let setRepos: Observable<Mutation> = repoService.fetchRepositories(page: page)
        .map { page > 1 ? .addRepos($0.0, pages: $0.1) : .setRepos($0.0, pages: $0.1) }
        .catchError({ err in
          Observable.merge([
            .just(.setError(RepoError(message: err.localizedDescription, isError: true)))
          ])
        })
      
      return setLoading.concat(setRepos)
    }
  }
  
  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    
    switch mutation {
    case let .setRepos(data, pages):
      newState.pages = pages
      newState.repositories = data
      newState.isLoading = false
    case let .setLoading(condition):
      newState.isLoading = condition
    case let .setError(error):
      newState.error = error
    case let .addRepos(repos, pages):
      newState.page += 1
      newState.pages = pages
      newState.repositories.append(contentsOf: repos)
    }
    
    return newState
  }
}
