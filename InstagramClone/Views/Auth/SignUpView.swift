//
//  SignUpView.swift
//  InstagramClone
//
//  Created by Yassine EL KEFI on 23/2/2025.
//

import SwiftUI

struct SignUpView: View {
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @EnvironmentObject var authManager: AuthManager
    @State private var isLoading = false
    @State private var errorMessage: String?
    
    var body: some View{
        VStack{
            Spacer()
            
            // Instagram Logo
            Text("Instagram")
                .font(.system(size: 30, weight: .bold))
            /*Image(systemName: "camera.viewfinder")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.bottom, 30)
             */
            
            // Email Field
            TextField("Email", text: $email)
                .textInputAutocapitalization(.none)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
            
            // Username Field
            TextField("Username", text: $username)
                .textInputAutocapitalization(.none)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
            
            // Password Field
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
            
            // Confirm Password Field
            SecureField("Confirm Password", text: $confirmPassword)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
            
            //Error Message
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.footnote)
                    .padding(.top, 5)
            }
            
            // Sign Up Button
            Button(action: registerUser){
                if isLoading{
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .frame(maxWidth: .infinity)
                        .padding()
                }else{
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                }
            }
            .background(Color.blue)
            .cornerRadius(8)
            .padding(.horizontal)
            .padding(.top, 10)
            .disabled(isLoading)
                        
            Spacer()
        }
    }
    
    private func registerUser(){
        guard password == confirmPassword else {
            errorMessage = "Passwords do not match."
            return
        }
        isLoading = true
        errorMessage = nil
        
        authManager.register(username: username, email: email, password: password){ success, error in
            DispatchQueue.main.async {
                isLoading = false
                if success {
                    print("✅ Registration successful")
                }else{
                    errorMessage = error ?? "Registration Failed . Please try again later."
                }
            }
        }
    }
}


struct SignUpViewPreview: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
