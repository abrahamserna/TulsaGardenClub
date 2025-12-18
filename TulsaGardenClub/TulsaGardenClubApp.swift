//
//  TulsaGardenClubApp.swift
//  TulsaGardenClub
//
//  Created by AM Student on 9/16/25.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
@main
struct TulsaGardenClubApp: App {
    init() {
           FirebaseApp.configure()
       }
    var body: some Scene {
      WindowGroup {
        NavigationView {
         SplashScreenView()
        }
      }
    }
  }
