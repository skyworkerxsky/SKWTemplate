import ReactorKit
import RxCocoa
import RxSwift

extension RepoDetail: View {
  public func bind(reactor: RepoDetailReactor) {
    let state = reactor.state.distinctUntilChanged().share(replay: 1)
    
    state.map(\.repo)
      .map { $0?.name }
      .bind { [weak self] in
        self?.title = $0
      }
      .disposed(by: disposeBag)
    
    state.map(\.repo)
      .bind(to: rx.loadRequest)
      .disposed(by: disposeBag)
    
    webView.rx.didFinishLoad
      .bind(onNext: { [weak self] _ in
        self?.activityIndicator.stopAnimating()
      })
      .disposed(by: disposeBag)
    
  }
}
