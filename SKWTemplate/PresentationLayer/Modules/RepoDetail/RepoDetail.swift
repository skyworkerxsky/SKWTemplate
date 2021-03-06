//
//  RepoDetail.swift
//  SKWTemplate
//
//  Created by Алексей Макаров on 14.09.2021.
//

import UIKit
import PinLayout
import RxSwift
import WebKit

public final class RepoDetail: UIViewController {
  
  #if DEBUG
  deinit {
    print("❤️ Deinit - ", self)
  }
  #endif
  
  public var disposeBag = DisposeBag()
  
  private(set) lazy var webView: WKWebView = .init()
  private(set) lazy var activityIndicator: UIActivityIndicatorView = {
    let activityIndicator: UIActivityIndicatorView = .init()
    activityIndicator.startAnimating()
    activityIndicator.hidesWhenStopped = true
    return activityIndicator
  }()
  
  var handler: RepoDetailEventHandler!
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    
    createUI()
    configureUI()
    configureLayout()
  }
  
  private func createUI() {
    [webView,
     activityIndicator].forEach { view.addSubview($0) }
  }
  
  private func configureUI() {
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(share))
  }
  
  private func configureLayout() {
    webView.pin.top().left().right().bottom()
    activityIndicator.pin.center()
  }
  
}
