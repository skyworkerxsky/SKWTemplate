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
    var test: [String] = []
  }
  
  enum Action: Equatable {
    case getRepos
  }
  
  public enum Mutation: Equatable {
    case setRepos([String] = [])
    case addRepos
  }
  
  func mutate(action: Action) -> Observable<Mutation> {
    
    var resu: [String] = ["4", "8", "16"]
    
    switch action {
    case .getRepos:
      return
      
//      provider.request(.repositories) { result in
//        switch result {
//        case .success(let response):
//          let data = try! JSONDecoder().decode(RepoResponse.self, from: response.data)
//          resu = data.items.compactMap { String($0.name) }
//        case .failure:
//          print("fail")
//        }
//      }
      
//      return .just(.setRepos(resu))
//      return .never()
    
      let provider = RxMoyaProvider<MoyaExampleService>()
          provider.request(.getRestaurants())
              .mapObject(RestaurantsResponse.self)
              .catchError { error in
                  // Do something with error
                  return Observable.error(error)
              }
              .subscribe(
                  onNext: { response in
                      self.restaurants = response.data
                  }
              )
              .addDisposableTo(disposeBag)
    }
  }
  
  public func transform(action: Observable<Action>) -> Observable<Action> {
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
  
  // MARK: - Method
  
//  private func search(query: String?, page: Int) -> Observable<(repos: [String], nextPage: Int?)> {
//    let emptyResult: ([String], Int?) = ([], nil)
//    guard let url = self.url(for: query, page: page) else { return .just(emptyResult) }
//    return URLSession.shared.rx.json(url: url)
//      .map { json -> ([String], Int?) in
//        guard let dict = json as? [String: Any] else { return emptyResult }
//        guard let items = dict["items"] as? [[String: Any]] else { return emptyResult }
//        let repos = items.compactMap { $0["full_name"] as? String }
//        let nextPage = repos.isEmpty ? nil : page + 1
//        return (repos, nextPage)
//      }
//      .do(onError: { error in
//        if case let .some(.httpRequestFailed(response, _)) = error as? RxCocoaURLError, response.statusCode == 403 {
//          print("⚠️ GitHub API rate limit exceeded. Wait for 60 seconds and try again.")
//        }
//      })
//      .catchErrorJustReturn(emptyResult)
//  }
}
