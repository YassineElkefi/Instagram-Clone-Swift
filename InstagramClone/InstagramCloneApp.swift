//
//  InstagramCloneApp.swift
//  InstagramClone
//
//  Created by Yassine EL KEFI on 23/2/2025.
//

import SwiftUI

@main
struct InstagramCloneApp: App {
    @StateObject var authManager = AuthManager()
    var body: some Scene {
        WindowGroup {
            if authManager.isAuthenticated{
                MainTabView()
                    .environmentObject(authManager)
            }else{
                LoginView()
                    .environmentObject(authManager)
            }
        }
    }
}
