import UIKit
import RxSwift
import PinLayout

final class RepoListVC: BaseCollectionViewController {
  
  var handler: RepoListEventHandler!
  var router: RepoListRoutable!
  
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
