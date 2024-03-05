//
//  ShowcaseApp.swift
//  Showcase
//
//  Created by Dhruvsai Dhulipudi on 1/28/24.
//

import SwiftUI
import SwiftData
import FirebaseCore

@main
struct ShowcaseApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
        FirebaseApp.configure()
    }
   
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
