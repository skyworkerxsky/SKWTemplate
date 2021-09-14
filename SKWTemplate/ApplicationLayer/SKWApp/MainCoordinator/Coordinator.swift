//
//  Coordinator.swift
//  SKWTemplate
//
//  Created by Алексей Макаров on 14.09.2021.
//

import Foundation
import UIKit

enum Event {
  case openDetail
}

protocol Coordinator {
  var navigationController: UINavigationController? { get set }
  
  func eventOccured(with type: Event)
  func start()
}

protocol Coordinating {
  var coordinator: Coordinator? { get set }
}
