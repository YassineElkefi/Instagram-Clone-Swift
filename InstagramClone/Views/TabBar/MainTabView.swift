//
//  MainTabView.swift
//  InstagramClone
//
//  Created by Yassine EL KEFI on 23/2/2025.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            Text("Search")
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            
            Text("Reels")
                .tabItem{
                    Image(systemName: "play.rectangle.fill")
                    Text("Reels")
                }
            
            Text("Activity")
                .tabItem{
                    Image(systemName: "heart.fill")
                    Text("Activity")
                }
            
            ProfileView()
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
