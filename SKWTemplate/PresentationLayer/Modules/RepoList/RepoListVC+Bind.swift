import ReactorKit
import RxCocoa
import RxSwift

extension RepoListVC: View {
  public func bind(reactor: RepoListVCReactor) {
    let state = reactor.state.distinctUntilChanged().share(replay: 1)
    
    state.map(\.repositories)
      .bind(to: tableView.rx.items(cellIdentifier: "cell")) { indexPath, repo, cell in
        cell.textLabel?.text = repo.name
      }
      .disposed(by: disposeBag)
    
    tableView.rx.itemSelected
      .subscribe(onNext: { [self] item in
        let currentItem = reactor.currentState.repositories[item.item]
        self.router.openDetail(repo: currentItem)
      })
      .disposed(by: disposeBag)
    
    tableView.rx.willEndDragging
      .subscribe(onNext: { [self] in
        let distance = self.tableView.contentSize.height - ($0.targetContentOffset.pointee.y + self.tableView.bounds.height)
        
        let page = reactor.currentState.page
        let pages = reactor.currentState.pages
        
        if distance < 100, page < pages {
          reactor.action.onNext(.fetchRepos(page: page + 1))
        }
      })
      .disposed(by: disposeBag)
    
    state.map(\.isLoading)
      .filter { $0 == false }
      .bind { [self] _ in
        activityIndicator.stopAnimating()
        tableView.isHidden = false
      }
      .disposed(by: disposeBag)
    
    // error handling
    state.map(\.error)
      .filter { $0.isError && !$0.message.isEmpty }
      .bind {
        print("isError - ", $0)
      }
      .disposed(by: disposeBag)
  }
}
