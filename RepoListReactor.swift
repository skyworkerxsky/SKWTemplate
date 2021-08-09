import ReactorKit
import RxCocoa
import RxSwift
import Moya

final class RepoListVCReactor: Reactor {
  
  public let initialState: RepoListVCReactor.State
  
  let provider = MoyaProvider<RepositoryService>()
  
  public init() {
    initialState = State()
  }
  
  struct State: Equatable {
    var test: [String] = ["4", "8", "11"]
  }
  
  enum Action: Equatable {
    case getRepos
  }
  
  public enum Mutation: Equatable {
    case setRepos([String] = [])
    case addRepos
  }
  
  func mutate(action: Action) -> Observable<Mutation> {
    
    switch action {
    case .getRepos:
      print("get repos")
      return .never()
    }
  }
  
  func transform(action: Observable<Action>) -> Observable<Action> {
    action
      .startWith(.getRepos)
  }
  
  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    
    switch mutation {
    case let .setRepos(data):
      newState.test = data
    case .addRepos: break
    default: break
    }
    
    return newState
  }
  
}
