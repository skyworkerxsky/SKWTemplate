import UIKit
import ReactorKit
import RxCocoa
import RxSwift

class RepoListVC: UIViewController, View {
  
  var disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .red
  }
  
  func bind(reactor: RepoListVCReactor) {
    let state = reactor.state.distinctUntilChanged().share(replay: 1)
    

  }
}

