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
    
    var body: some View{
        NavigationView{
            VStack{
                Spacer()
                
                //Instagram Logo
                Image(systemName: "camera.viewfinder")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.bottom, 30)
                
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
                    
                //Login Button
                Button(action: {
                    print("Login Tapped")
                }) {
                    Text("Login")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                        .padding(.horizontal)
                }
                .padding(.top, 10)
                
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
}

struct LginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
