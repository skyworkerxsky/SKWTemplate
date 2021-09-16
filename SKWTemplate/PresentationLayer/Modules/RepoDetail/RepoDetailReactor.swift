import ReactorKit
import RxCocoa
import RxSwift
import DITranquillity

final class ReactorDetailPart: DIPart {
  static func load(container: DIContainer) {
    container.register(RepoDetailReactor.init)
      .as(RepoDetailReactor.self)
      .lifetime(.objectGraph)
  }
}

public final class RepoDetailReactor: Reactor {
  
  // MARK: - Initial
  
  public let initialState: RepoDetailReactor.State
  
  // MARK: - Init
  
  init() {
    initialState = State()
  }
  
  // MARK: - State
  
  public struct State: Equatable {
    var repo: RepoModel!
  }
  
  // MARK: - Action
  
  public enum Action: Equatable {
    case initial(repo: RepoModel)
  }
  
  // MARK: - Mutation
  
  public enum Mutation: Equatable {
    case setRepo(RepoModel)
  }
  
  // MARK: - Implementation
  
  public func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case let .initial(repo):
      return .just(.setRepo(repo))
    }
  }
  
  public func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    
    switch mutation {
    case let .setRepo(repo):
      newState.repo = repo
    }
    
    return newState
  }
  
  public func transform(state: Observable<State>) -> Observable<State> {
    state.filter { $0.repo != nil }
  }
  
}
