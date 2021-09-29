//
//  BaseCollectionView.swift
//  SKWTemplate
//
//  Created by Алексей Макаров on 21.09.2021.
//

import Foundation
import IGListKit
import PinLayout

class BaseCollectionViewController: BaseViewController, ListAdapterDataSource {
  
  private(set) lazy var collectionView: UICollectionView = .init()
  var items: [ListDiffable] = []
  
  // MARK: - Properties
  
  public lazy var adapter: ListAdapter = {
    ListAdapter(updater: ListAdapterUpdater(), viewController: self)
  }()
  
  public var scrollViewDelegate: UIScrollViewDelegate? {
    get {
      return adapter.scrollViewDelegate
    }
    set {
      adapter.scrollViewDelegate = newValue
    }
  }
  
  private lazy var manager: AdapterManager = { [unowned self] in
    AdapterManager(items: adapterCreators())
  }()
  
  // MARK: - Setup
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(collectionView)
    
    collectionView.pin.top().left().right().bottom()
    
    adapter.collectionView = collectionView
    //      self.collectionView.contentInset.bottom = self.defaultBottomInset
    adapter.dataSource = self
  }
  
  // MARK: - Methods
  
  public func adapterCreators() -> [AdapterCreator] {
    fatalError("Override me")
  }
  
  // MARK: - IGListAdapterDataSource
  
  func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    return items
  }
  
  func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    return manager.adapter(from: object)
  }
  
  func emptyView(for listAdapter: ListAdapter) -> UIView? {
    return nil
  }
  
}
