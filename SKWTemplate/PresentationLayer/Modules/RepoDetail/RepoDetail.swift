//
//  RepoDetail.swift
//  SKWTemplate
//
//  Created by Алексей Макаров on 14.09.2021.
//

import UIKit
import PinLayout

protocol RepoDetailEventHandler: AnyObject {
  func bind(view: UIViewController,
            router: RepoDetailRoutable,
            data: RepoModel)
}

class RepoDetail: UIViewController {
  
  public var repo: RepoModel!
  
  private(set) lazy var webView: UIWebView = .init()
  private(set) lazy var activityIndicator: UIActivityIndicatorView = {
    let activityIndicator: UIActivityIndicatorView = .init()
    activityIndicator.startAnimating()
    activityIndicator.hidesWhenStopped = true
    return activityIndicator
  }()
  
  var handler: RepoDetailEventHandler!
  
  override func viewDidLoad() {
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
    webView.delegate = self
    title = repo.name
    
    guard let url = URL(string: repo.url) else { return }
    let request = URLRequest(url: url)
    webView.loadRequest(request)
  }
  
  private func configureLayout() {
    webView.pin.top().left().right().bottom()
    activityIndicator.pin.center()
  }
  
}

extension RepoDetail: UIWebViewDelegate {
  func webViewDidFinishLoad(_ webView: UIWebView) {
    activityIndicator.stopAnimating()
  }
}
