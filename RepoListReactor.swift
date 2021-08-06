import ReactorKit
import RxCocoa
import RxSwift

final class RepoListVCReactor: Reactor {
  
  public let initialState: RepoListVCReactor.State
  
  public init() {
    initialState = State()
  }
  
  struct State: Equatable {
    
  }
  
  enum Action: Equatable {
    case getRepos
  }
  
  enum Mutation: Equatable {
    
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
    var newState = state
    
    switch mutation {
    default: break
    }
    
    return newState
  }
}
