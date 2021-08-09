import UIKit
import RxSwift
import YogaKit

class RepoListVC: UIViewController {
  
  var disposeBag = DisposeBag()
  
  private(set) lazy var testBtn: UIButton = .init()
  private(set) lazy var tableView: UITableView = .init()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    view.addSubview(tableView)
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    view.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
    }
    
    tableView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
    }
    
    view.yoga.applyLayout(preservingOrigin: true)
  }

}
