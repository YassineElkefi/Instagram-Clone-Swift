//
//  HomeView.swift
//  InstagramClone
//
//  Created by Yassine EL KEFI on 23/2/2025.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVStack{
                    ForEach(networkManager.posts){ post in
                        PostView(post: post)
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Instagram")
            .onAppear{
                networkManager.fetchPosts()
            }
        }
    }
}

struct HomeViewPreview : PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
