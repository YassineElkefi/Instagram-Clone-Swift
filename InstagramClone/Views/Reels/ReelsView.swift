//
//  ReelsView.swift
//  InstagramClone
//
//  Created by Yassine EL KEFI on 23/2/2025.
//

import Foundation
import SwiftUI
import AVKit
struct ReelsView: View {
    let videos = ["video1", "video2", "video3"]
    var body: some View {
        TabView{
            
            ForEach(videos, id: \.self) { video in
                ReelsPlayerView(videoName: video)
                    .edgesIgnoringSafeArea(.all)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct ReelsView_Previews: PreviewProvider {
    static var previews: some View {
        ReelsView()
    }
}
