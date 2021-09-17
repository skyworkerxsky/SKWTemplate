import UIKit
import RxSwift
import PinLayout

protocol RepoListEventHandler: AnyObject {
  func bind(view: UIViewController, router: RepoListRoutable)
}

public final class RepoListVC: UIViewController {
  
  var handler: RepoListEventHandler!
  var router: RepoListRoutable!
  
  public var disposeBag = DisposeBag()
  
  private(set) lazy var activityIndicator: UIActivityIndicatorView = {
    let activityIndicator: UIActivityIndicatorView = .init()
    activityIndicator.startAnimating()
    activityIndicator.hidesWhenStopped = true
    return activityIndicator
  }()
  
  private(set) lazy var tableView: UITableView = {
    let tableView: UITableView = .init()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.isHidden = true
    return tableView
  }()
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    
    createUI()
    configureUI()
    configureLayout()
  }
  
  private func createUI() {
    [tableView,
     activityIndicator].forEach { view.addSubview($0) }
  }
  
  private func configureUI() {}
  
  private func configureLayout() {
    tableView.pin.top().left().right().bottom()
    activityIndicator.pin.center()
  }
  
}
