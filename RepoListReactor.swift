import ReactorKit
import RxCocoa
import RxSwift
import Moya
import DITranquillity

final class RepoListPart: DIPart {
  static func load(container: DIContainer) {
    container.register(RepoListVCReactor.init)
      .as(RepoListVCReactor.self)
      .lifetime(.objectGraph)
  }
}

final class RepoListVCReactor: Reactor {
  
  // MARK: - Private
  
  private let bag = DisposeBag()
  var provider: RepositoryServiceImplementation
  
  // MARK: - Initial
  
  internal let initialState: RepoListVCReactor.State
  
  // MARK: - Init
  
  public init(provider: RepositoryServiceImplementation) {
    initialState = State()
    
    self.provider = provider
  }
  
  // MARK: - State
  
  struct State: Equatable {
    var test: [Repo] = []
  }
  
  // MARK: - Action
  
  enum Action: Equatable {
    case getRepos
  }
  
  // MARK: - Mutation
  
  public enum Mutation: Equatable {
    case setRepos([Repo] = [])
    case addRepos
  }
  
  // MARK: - Implementation
  
  func transform(action: Observable<Action>) -> Observable<Action> {
    action
      .startWith(.getRepos)
  }
  
  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .getRepos:
      return Observable.merge([
        self.provider.fetchRepositories().map { .setRepos($0)}
      ])
    }
  }
  
  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    
    switch mutation {
    case let .setRepos(data):
      newState.test = data
    case .addRepos: break
    }
    
    return newState
  }
  
  // MARK: - Methods
  
//  private func getRepositories() -> Observable<[Repo]> {
//    provider.rx
//      .request(.repositories)
//      .map(RepoResponse.self, failsOnEmptyData: false)
//      .map { $0.items }
//      .asObservable()
//  }
}
