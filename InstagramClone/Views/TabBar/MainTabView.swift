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
            
            SearchView()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            
            ReelsView()
                .tabItem{
                    Image(systemName: "play.rectangle.fill")
                    Text("Reels")
                }
            
            ActivityView()                .tabItem{
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
