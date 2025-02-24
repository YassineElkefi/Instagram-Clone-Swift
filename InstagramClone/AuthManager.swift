//
//  AuthManager.swift
//  InstagramClone
//
//  Created by Yassine EL KEFI on 24/2/2025.
//

import Foundation

class AuthManager: ObservableObject {
    
    @Published var user: User?
    @Published var isAuthenticated: Bool = false
    
    let baseURL = "http://localhost:3000/api/auth"
    
    func register(username: String, email: String, password: String, completion: @escaping (Bool, String?) -> Void) {
        let url = URL(string: "\(baseURL)/register")!
        let body: [String: Any] = ["username": username, "email": email, "password": password]
        
        sendRequest(url: url, body: body) { success, user, error in
            DispatchQueue.main.async {
                if success {
                    self.user = user
                    self.isAuthenticated = true
                    completion(true, nil)
                } else {
                    completion(false, error)
                }
            }
        }
    }
    
    func login(email: String, password: String, completion: @escaping (Bool, String?) -> Void){
        let url = URL(string: "\(baseURL)/login")!
        let body : [String: Any] = ["email": email, "password": password]
        
        sendRequest(url: url, body: body){ success, user, error in
            DispatchQueue.main.async {
                if success{
                    self.user = user
                    self.isAuthenticated = true
                    completion(true, nil)
                }else{
                    completion(false, error)
                }
            }
        }
    }
    
    private func sendRequest(url: URL, body: [String: Any], completion: @escaping (Bool, User?, String?) -> Void) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try? JSONSerialization.data(withJSONObject: body)

            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    if let user = try? JSONDecoder().decode(User.self, from: data) {
                        completion(true, user, nil)
                        return
                    } else {
                        let errorMessage = String(data: data, encoding: .utf8) ?? "Unknown error"
                        completion(false, nil, errorMessage)
                        return
                    }
                }
                completion(false, nil, error?.localizedDescription ?? "Network error")
            }.resume()
        }
}
