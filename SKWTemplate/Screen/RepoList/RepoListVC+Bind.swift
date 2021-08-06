import ReactorKit
import RxCocoa
import RxSwift

extension RepoListVC: View {
  public func bind(reactor: RepoListVCReactor) {
    let state = reactor.state.distinctUntilChanged().share(replay: 1)
    
    testBtn
      .rx
      .tap
      .bind { _ in
        print("tap")
      }
      .disposed(by: disposeBag)
    
  }
}
