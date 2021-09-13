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
    var repositories: [Repo] = []
    var isLoading: Bool = false
    var isError: Bool = false
  }
  
  // MARK: - Action
  
  enum Action: Equatable {
    case getRepos
  }
  
  // MARK: - Mutation
  
  public enum Mutation: Equatable {
    case setRepos([Repo] = [])
    case setLoading(Bool)
    case setError(Bool)
  }
  
  // MARK: - Implementation
  
  func transform(action: Observable<Action>) -> Observable<Action> {
    action
      .startWith(.getRepos)
  }
  
  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .getRepos:
      let setLoading: Observable<Mutation> = .just(.setLoading(true))
      let setRepos: Observable<Mutation> = repoService.fetchRepositories()
        .map { .setRepos($0) }
        .catchError({ err in
          print("error - ", err.localizedDescription)
          return Observable.merge(.just(.setError(true)))
        })
      
      return setLoading.concat(setRepos)
    }
  }
  
  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    
    switch mutation {
    case let .setRepos(data):
      newState.repositories = data
      newState.isLoading = false
    case let .setLoading(condition):
      newState.isLoading = condition
    case let .setError(error):
      newState.isError = error
    }
    
    return newState
  }
}