//
//  ElixrTalentConnectAppApp.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 05/03/24.
//

import SwiftUI
import Firebase

@main
struct ElixrTalentConnectAppApp: App {
    
    @UIApplicationDelegateAdaptor(Appdelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            SplashScreen()
        }
    }
}

class Appdelegate: NSObject,UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        print("Firebase configured..")
        return true
    }
}
