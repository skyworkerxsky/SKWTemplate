import ReactorKit
import RxCocoa
import RxSwift
import YandexMobileMetrica

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
        print("TAP")
        let params : [String : Any] = ["key1": "value1", "key2": "value2"]
        YMMYandexMetrica.reportEvent("EVENT", parameters: params, onFailure: { error in
          print("DID FAIL REPORT EVENT: %@")
          print("REPORT ERROR: %@", error.localizedDescription)
        })
      })
      .disposed(by: disposeBag)
    
  }
}
