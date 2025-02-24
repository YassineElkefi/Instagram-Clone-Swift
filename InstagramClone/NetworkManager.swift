//
//  NetworkManager.swift
//  InstagramClone
//
//  Created by Yassine EL KEFI on 24/2/2025.
//

import Foundation

class NetworkManager : ObservableObject{
    @Published var posts: [Post] = []
    
    func fetchPosts() {
            guard let url = URL(string: "http://localhost:3000/api/posts") else { return }
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error fetching posts: \(error)")
                    return
                }
                
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let decodedPosts = try decoder.decode([Post].self, from: data)
                        DispatchQueue.main.async {
                            self.posts = decodedPosts
                        }
                    } catch {
                        print("Error decoding posts: \(error)")
                    }
                }
            }
            
            task.resume()
        }
    
    func createPost(post:Post){
        guard let url = URL(string: "http://localhost:3000/api/posts") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        if let jsonData = try? encoder.encode(post){
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error creating post: \(error)")
                    return
                }
                print("Post created suceesfully")
            }
            task.resume()
        }
    }
}
