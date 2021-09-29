//
//  RepoCell.swift
//  SKWTemplate
//
//  Created by Алексей Макаров on 21.09.2021.
//

import UIKit

final class RepoCell: UICollectionViewCell {
  
  // MARK: - UI
  
  // MARK: - Life cycle
  
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Configure
  
  @discardableResult
  func configure(model: RepoModel) -> RepoCell {
    
    return self
  }
  
  @discardableResult
  func layout() -> CGFloat {
    
    return 60
  }
  
}
