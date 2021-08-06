import UIKit
import RxSwift
import YogaKit

class RepoListVC: UIViewController {
  
  var disposeBag = DisposeBag()
  
  private(set) lazy var testBtn: UIButton = .init()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    testBtn.backgroundColor = .red
    
    view.addSubview(testBtn)
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    view.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
      layout.justifyContent = .center
      layout.alignItems = .center
    }
    
    testBtn.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 50
      layout.height = 50
    }
    
    view.yoga.applyLayout(preservingOrigin: true)
  }

}
