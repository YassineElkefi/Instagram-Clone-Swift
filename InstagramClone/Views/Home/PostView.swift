//
//  PostView.swift
//  InstagramClone
//
//  Created by Yassine EL KEFI on 23/2/2025.
//

import Foundation
import SwiftUI

struct PostView: View {
    let post: Post
    
    var body: some View{
        VStack(alignment: .leading, spacing: 8){
            //User Info
            HStack{
                AsyncImage(url: URL(string: post.profileImage!)) { image in
                                    image.resizable()
                                        .scaledToFill()
                                } placeholder: {
                                    Color.gray
                                }
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                
                /*Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                 */
                
                Text(post.user)
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
            AsyncImage(url: URL(string: post.imageUrl!)){ image in
                image.resizable()
                    .scaledToFit()
            }placeholder: {
                Color.gray
            }
            
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
            Text("\(post.likes) likes")
                .font(.footnote)
                .padding(.horizontal)
            
            //Caption
            HStack{
                Text(post.user)
                    .font(.footnote)
                    .bold() +
                Text(post.caption)
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
        PostView(post: Post(id: "1", user: "Yassine", profileImage: "https://fastly.picsum.photos/id/52/200/300.jpg?hmac=inayaUU4kX3byMsd5J9f69GP4-Tt78mJ9lD21t34Cks", imageUrl: "https://fastly.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U", caption: "Bom Bom Fish", likes: 25))
    }
}
