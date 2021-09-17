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

protocol RepoDetailEventHandler: AnyObject {
  func bind(view: UIViewController,
            router: RepoDetailRoutable,
            data: RepoModel)
}

public final class RepoDetail: UIViewController {
  
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
  
  @objc private func share() {
    let image = UIImage()
    let url = "url"
    
    let textShare = [image, url]
    let activityViewController = UIActivityViewController(activityItems: textShare, applicationActivities: nil)
    activityViewController.popoverPresentationController?.sourceView = self.view
    self.present(activityViewController, animated: true, completion: nil)
  }
  
  private func configureLayout() {
    webView.pin.top().left().right().bottom()
    activityIndicator.pin.center()
  }
  
}
