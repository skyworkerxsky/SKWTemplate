import UIKit
import ReactorKit

public class AppRouter {
  private var window: UIWindow!
  
  init() {}
  
  private func createWindow() -> UIWindow {
    self.window = UIWindow(frame: UIScreen.main.bounds)
    self.window.backgroundColor = .white
    return self.window
  }
  
  public func openDefaultScene() {
    let module = RepoListVCAssembly.createModule()
    let nc = UINavigationController(rootViewController: module)
    
    ShowWindowRouter(target: nc,
                     window: self.createWindow()).move()
  }
}


public final class ShowWindowRouter {
  let target: UIViewController
  let window: UIWindow
  
  init(target: UIViewController, window: UIWindow) {
    self.target = target
    self.window = window
  }
  
  public func move() {
    self.present(self.target, using: self.window)
  }
  
  private func present(_ controller: UIViewController, using window: UIWindow) {
    window.rootViewController = controller
    window.makeKeyAndVisible()
  }
}
