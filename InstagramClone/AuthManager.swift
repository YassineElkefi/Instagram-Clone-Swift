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
    private let tokenKey = "authToken"
    
    init() {
        loadToken()
    }
    
    func register(username: String, email: String, password: String, completion: @escaping (Bool, String?) -> Void) {
        let url = URL(string: "\(baseURL)/register")!
        let body: [String: Any] = ["username": username, "email": email, "password": password]
        
        sendRequest(url: url, body: body) { success, user, error in
            DispatchQueue.main.async {
                if success {
                    self.objectWillChange.send()
                    self.user = user
                    self.isAuthenticated = true
                    self.saveToken(user?.token)
                    completion(true, nil)
                } else {
                    completion(false, error)
                }
            }
        }
    }
    
    func login(email: String, password: String, completion: @escaping (Bool, String?) -> Void) {
        let url = URL(string: "\(baseURL)/login")!
        let body: [String: Any] = ["email": email, "password": password]
        
        sendRequest(url: url, body: body) { success, user, error in
            DispatchQueue.main.async {
                if success {
                    self.objectWillChange.send()
                    self.user = user
                    self.isAuthenticated = true
                    print("Authentication state changed: \(self.isAuthenticated)")
                    self.saveToken(user?.token)
                    completion(true, nil)
                } else {
                    completion(false, error)
                }
            }
        }
    }
    
    func logout(){
        user = nil
        isAuthenticated = false
        UserDefaults.standard.removeObject(forKey: tokenKey)
    }
    
    func saveToken(_ token: String?) {
        guard let token = token else { return }
        UserDefaults.standard.set(token, forKey: tokenKey)
    }
    
    func loadToken() {
        if let token = UserDefaults.standard.string(forKey: tokenKey), !token.isEmpty {
            self.isAuthenticated = true
        }
    }
    
    private func sendRequest(url: URL, body: [String: Any], completion: @escaping (Bool, User?, String?) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion(false, nil, error?.localizedDescription ?? "Network error")
                return
            }
            
            // Print the response for debugging
            print("Response data: \(String(data: data, encoding: .utf8) ?? "No data")")
            
            do {
                let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                // Create a User object from the response
                let user = User(
                    id: loginResponse.user.id,
                    username: loginResponse.user.username,
                    email: loginResponse.user.email,
                    profileImage: loginResponse.user.profileImage,
                    token: loginResponse.token
                )
                completion(true, user, nil)
            } catch {
                print("Decoding error: \(error)")
                let errorMessage = String(data: data, encoding: .utf8) ?? "Unknown error"
                completion(false, nil, errorMessage)
            }
        }.resume()
    }
}
