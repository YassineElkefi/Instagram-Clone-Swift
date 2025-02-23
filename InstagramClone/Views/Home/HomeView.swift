//
//  HomeView.swift
//  InstagramClone
//
//  Created by Yassine EL KEFI on 23/2/2025.
//

import Foundation
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVStack{
                    ForEach(0..<10, id: \.self){ _ in
                        PostView()
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Instagram")
        }
    }
}

struct HomeViewPreview : PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
