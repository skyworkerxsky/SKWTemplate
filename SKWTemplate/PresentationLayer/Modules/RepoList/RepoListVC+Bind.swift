import ReactorKit
import RxCocoa
import RxSwift

extension RepoListVC: View {
  public func bind(reactor: RepoListVCReactor) {
    // let state = reactor.state.distinctUntilChanged().share(replay: 1)
    
    reactor.state.map(\.repositories)
      .bind(to: tableView.rx.items(cellIdentifier: "cell")) { indexPath, repo, cell in
        cell.textLabel?.text = repo.name
      }
      .disposed(by: disposeBag)
    
    tableView.rx.itemSelected
      .subscribe(onNext: { _ in
        print("tap action")
      })
      .disposed(by: disposeBag)
    
  }
}
