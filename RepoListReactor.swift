import ReactorKit
import RxCocoa
import RxSwift

final class RepoListVCReactor: Reactor {
  
  public let initialState: RepoListVCReactor.State
  
  public init() {
    initialState = State()
  }
  
  struct State: Equatable {
    var page: Int = 1
    var pages: Int = 0
    public var repos: [String] = []
  }
  
  enum Action: Equatable {
    case getRepos
  }
  
  enum Mutation: Equatable {
    case setRepos([String])
    case addRepos([String])
  }
  
  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .getRepos:
      print("get repos action")
      return .never()
    }
  }
  
  public func transform(action: Observable<Action>) -> Observable<Action> {
    action
      .startWith(.getRepos)
  }
  
  func reduce(state: State, mutation: Mutation) -> State {
    switch mutation {
    case let .setRepos(repos):
      var newState = state
      newState.repos = repos
      return newState
    case let .addRepos(repos):
      var newState = state
      newState.repos += repos
      return newState
    }
  }
}
