//
//  helpDBApp.swift
//  helpDB
//
//  Created by Jonathan Breaker on 5/9/25.
//

import SwiftUI
import FirebaseCore
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      print("🚀 Firebase configured")

    return true
  }
}

@main
struct helpDBApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
//    init() {
//        FirebaseApp.configure()
//        print("✅ Firebase initialized")
//    }


    var body: some Scene {
        WindowGroup {
            AppView()
        }
    }
}

