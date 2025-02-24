//
//  Post.swift
//  InstagramClone
//
//  Created by Yassine EL KEFI on 24/2/2025.
//

import Foundation

struct Post: Identifiable, Codable {
    let id: Int
    let user: String
    let title: String
    let conent: String
    let likes: Int
}
