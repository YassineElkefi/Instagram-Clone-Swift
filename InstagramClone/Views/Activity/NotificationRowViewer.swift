//
//  NotificationRowViewer.swift
//  InstagramClone
//
//  Created by Yassine EL KEFI on 24/2/2025.
//

import Foundation
import SwiftUI

enum NotificationType {
    case like, comment, follow
}

struct NotificationRowViewer: View {
    let type: NotificationType
    let userName: String
    let postTitle: String
    
    var body: some View {
        HStack{
            // Icon Based on notification
            iconForType(type)
            VStack(alignment: .leading){
                Text("\(userName) \(notificationText(type))")
                    .font(.subheadline)
                Text(postTitle)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 8)
        }
    }
    
    func iconForType(_ type: NotificationType) -> some View {
        switch type {
        case .like:
            return Image(systemName: "heart.fill")
                .foregroundColor(.red)
        case .comment:
            return Image(systemName: "message.fill")
                .foregroundColor(.blue)
        case .follow:
            return Image(systemName: "person.fill")
                .foregroundColor(.green)
        }
    }
    func notificationText(_ type: NotificationType) -> String {
        switch type {
        case .like:
            return "liked your post"
        case .comment:
            return "commented on your post"
        case .follow:
            return "started following you"
        }
    }
    
}

struct NotificationRowViewer_Previews: PreviewProvider {
    static var previews: some View {
        NotificationRowViewer(type: .like, userName: "Yassine", postTitle: "Photo 1")
            .previewLayout(.sizeThatFits)
    }
}
