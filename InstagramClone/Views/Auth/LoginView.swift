//
//  LoginView.swift
//  InstagramClone
//
//  Created by Yassine EL KEFI on 23/2/2025.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject var authManager: AuthManager
    @State private var isLoading: Bool = false
    @State private var errorMessage: String?
    
    var body: some View{
        NavigationView{
            VStack{
                Spacer()
                
                //Instagram Logo
                Text("Instagram")
                    .font(.system(size: 30, weight: .bold))
                
                //Email Field
                TextField("Email", text: $email)
                    .textInputAutocapitalization(.none)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                //Password Field
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                //Error Message
                if let errorMessage = errorMessage{
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.footnote)
                        .padding(.top, 5)
                }
                
                //Login Button
                Button(action: loginUser) {
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .frame(maxWidth: .infinity)
                            .padding()
                    } else {
                        Text("Login")
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
                
                //Forgot Password
                Button(action: {
                    print("Forgot Password Tapped")
                }){
                    Text("Forgot Password?")
                        .foregroundColor(.blue)
                        .font(.footnote)
                }
                .padding(.top, 8)
                
                Spacer()
                
                //Sign up navigation
                NavigationLink(destination: SignUpView()){
                    HStack{
                        Text("Don't Have an account?")
                        Text("Sign Up")
                            .bold()
                    }
                    .font(.footnote)
                }
                .padding(.bottom, 30)
            }
        }
    }
    private func loginUser(){
        isLoading = true
        errorMessage = nil
        
        authManager.login(email: email, password: password){ success, error in
            DispatchQueue.main.async {
                isLoading = false
                if success{
                    print("✅ Login successful, navigating to home screen")
                }else{
                    errorMessage = error ?? "Login failed. Please try again."
                }
            }
        }
    }
}

struct LginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
