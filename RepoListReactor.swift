import ReactorKit
import RxCocoa
import RxSwift
import Moya

final class RepoListVCReactor: Reactor {
  
  // MARK: - Private
  
  private let bag = DisposeBag()
  private let provider = MoyaProvider<RepositoryService>()
  
  // MARK: - Internal
  
  internal let initialState: RepoListVCReactor.State
  
  // MARK: - Init
  
  public init() {
    initialState = State()
  }
  
  // MARK: - State
  
  struct State: Equatable {
    var test: [String] = ["4", "8", "11"]
  }
  
  // MARK: - Action
  
  enum Action: Equatable {
    case getRepos
  }
  
  // MARK: - Mutation
  
  public enum Mutation: Equatable {
    case setRepos([String] = [])
    case addRepos
  }
  
  func mutate(action: Action) -> Observable<Mutation> {
    
    switch action {
    case .getRepos:
      search()
        .subscribe(onNext: { items in
          _ = items
        })
        .disposed(by: bag)
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
    }
    
    return newState
  }
  
 // MARK: - Method
  
  private func search() -> Observable<[Repo]> {
    provider.rx
      .request(.repositories)
      .map(RepoResponse.self, failsOnEmptyData: false)
      .map {
        print("items: \($0.items)")
        return $0.items
      }
      .asObservable()
  }
}
