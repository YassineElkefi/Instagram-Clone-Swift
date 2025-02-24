//
//  Post.swift
//  InstagramClone
//
//  Created by Yassine EL KEFI on 24/2/2025.
//

import Foundation

struct Post: Identifiable, Codable {
    let id: String
    let user: String
    let profileImage: String?
    let imageUrl: String?
    let caption: String
    let likes: Int
}
