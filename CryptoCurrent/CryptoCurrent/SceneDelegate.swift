//
//  SceneDelegate.swift
//  CryptoCurrent
//
//  Created by Елена Русских on 2023-09-16.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?


  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    let window = UIWindow(windowScene: windowScene)
    let cryptoPriceView = CryptoPriceAssembler.assembleModule()
    window.rootViewController = cryptoPriceView
    window.makeKeyAndVisible()
    self.window = window
  }

  func sceneDidDisconnect(_ scene: UIScene) {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
  }

  func sceneDidBecomeActive(_ scene: UIScene) {
      guard let windowScene = scene as? UIWindowScene else { return }
      
      if let coverView = windowScene.windows.first?.viewWithTag(12345) {
        coverView.removeFromSuperview()
      }
  }

  func sceneWillResignActive(_ scene: UIScene) {
      guard let windowScene = (scene as? UIWindowScene) else { return }
      
      let blurEffect = UIBlurEffect(style: .systemUltraThinMaterial)
      let blurredEffectView = UIVisualEffectView(effect: blurEffect)
      blurredEffectView.frame = windowScene.coordinateSpace.bounds
      blurredEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      blurredEffectView.tag = 12345
      
      windowScene.windows.first?.addSubview(blurredEffectView)
  }

  func sceneWillEnterForeground(_ scene: UIScene) {
  }

  func sceneDidEnterBackground(_ scene: UIScene) {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
  }
}

