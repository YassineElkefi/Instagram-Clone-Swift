//
//  PostGridView.swift
//  InstagramClone
//
//  Created by Yassine EL KEFI on 23/2/2025.
//

import Foundation
import SwiftUI

struct PostGridView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var body: some View{
        LazyVGrid(columns: columns, spacing: 2){
            ForEach(0..<12, id:\.self){ _ in
                Image("post_placeholder")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipped()
            }
        }
        .padding(.horizontal, 2)
    }
}

struct PostGridViewPreview: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}
