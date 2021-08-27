//
//  AppDelegate.swift
//  SKWTemplate
//
//  Created by Алексей Макаров on 06.08.2021.
//

import UIKit
import YandexMobileMetrica

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    // Initializing the AppMetrica SDK.
    let configuration = YMMYandexMetricaConfiguration.init(apiKey: "39001014-a751-4de6-a511-81763952a694")
    YMMYandexMetrica.activate(with: configuration!)
    
    ContainerDI.container.append(framework: AppPart.self)

    if !ContainerDI.container.validate() {
      fatalError()
    }
    
    return true
  }

  // MARK: UISceneSession Lifecycle

  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
  }
}
