//
//  ActivityView.swift
//  InstagramClone
//
//  Created by Yassine EL KEFI on 24/2/2025.
//

import Foundation
import SwiftUI
struct ActivityView: View {
    var body: some View {
        NavigationView{
            List{
                NotificationRowViewer(type: .like, userName: "Imed", postTitle: "Photo 1")
                NotificationRowViewer(type: .comment, userName: "Ghassen", postTitle: "Photo 1")
                NotificationRowViewer(type: .follow, userName: "Yassine", postTitle: "Photo 1")
            }
            .navigationTitle("Activity")
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
