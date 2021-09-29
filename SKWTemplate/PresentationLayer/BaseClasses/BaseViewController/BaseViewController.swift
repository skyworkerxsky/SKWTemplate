//
//  BaseViewController.swift
//  SKWTemplate
//
//  Created by Алексей Макаров on 21.09.2021.
//

import RxSwift
import UIKit

class BaseViewController: UIViewController {
  
    public var disposeBag = DisposeBag()

    public var statusBarStyle: UIStatusBarStyle = .default

    deinit {
        print("[D] \(self) destroyed")
        NotificationCenter.default.removeObserver(self)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupBackButton()
        self.setupStrings()
    }

    func initialize() {}

    func setupStrings() {}

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.statusBarStyle
    }

    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .fade
    }

    func setupBackButton() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "",
                                                                style: .plain,
                                                                target: nil,
                                                                action: nil)
    }
}

