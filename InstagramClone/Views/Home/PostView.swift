//
//  PostView.swift
//  InstagramClone
//
//  Created by Yassine EL KEFI on 23/2/2025.
//

import Foundation
import SwiftUI

struct PostView: View {
    var body: some View{
        VStack(alignment: .leading, spacing: 8){
            //User Info
            HStack{
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                Text("Username")
                    .font(.headline)
                
                Spacer()
                
                Button(action:{
                    print("More Options")
                }){
                    Image(systemName: "ellipsis")
                        .foregroundColor(.primary)
                }
            }
            .padding(.horizontal)
            
            //Post Image
            Image("post_placeholder")
                .resizable()
                .scaledToFit()
            //Action buttons
            HStack(spacing: 16){
                Button(action: {
                    print("Like tapped")
                }){
                    Image(systemName: "heart")
                        .font(.title2)
                }
                
                Button(action: {
                    print("Comment tapped")
                }){
                    Image(systemName: "message")
                        .font(.title2)
                }
                
                Button(action: {
                    print("Share tapped")
                }){
                    Image(systemName: "paperplane")
                        .font(.title2)
                }
                Spacer()
            }
            .padding(.horizontal)
            
            //Like Counts
            Text("Liked by user1 and 1919 others")
                .font(.footnote)
                .padding(.horizontal)
            
            //Caption
            HStack{
                Text("Username")
                    .font(.footnote)
                    .bold() +
                Text(" Ma trabbina hasser fasser ma trabbina hancha thasser")
                    .font(.footnote)
            }
            .padding(.horizontal)
            
            //Timestamp
            Text("2 hours ago")
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.horizontal)
        }
        .padding(.bottom, 10)
    }
}

struct PostViewPreview: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
