//
//  AppDelegate.swift
//  SKWTemplate
//
//  Created by Алексей Макаров on 06.08.2021.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window:UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let dependencyConfiguration = DependenciesConfigurationBase(launchOptions: launchOptions)
    let coordinator = MainCoordinator(configuration: dependencyConfiguration)
    MainCoordinator.shared = coordinator
    coordinator.start()
    
    return true
  }
}
