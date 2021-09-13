import UIKit
import RxSwift
import PinLayout

class RepoListVC: UIViewController {
  
  var disposeBag = DisposeBag()
  
  private(set) lazy var tableView: UITableView = {
    let tableView: UITableView = .init()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    return tableView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    createUI()
    configureUI()
    configureLayout()
  }
  
  private func createUI() {
    view.addSubview(tableView)
  }
  
  private func configureUI() {
    view.backgroundColor = .white
  }
  
  private func configureLayout() {
    tableView.pin.top().left().right().bottom()
  }

}
