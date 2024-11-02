//
//  CreatView.swift
//  DDScan
//
//  Created by Edouard Pradie on 18/10/2024.
//

import SwiftUI

struct CreatView: View {
    @Binding var isUsername : String
    @Binding var isLogin : Bool
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var logError = false
    
    var body: some View {
        VStack {
            Image("DDScan")
                .resizable()
                .scaledToFit()
                .frame(width:  250.0)
                .padding()
            Text("Create your account")
                .frame(minWidth: 0, maxWidth: .infinity)
                .foregroundColor(Color.white)
                .font(Font.custom("Audiowide-Regular", size: 35))
            Spacer()
            Spacer()
            TextField("Username", text: $username)
                .padding()
                .background(Color.white)
                .cornerRadius(25)
                .textContentType(.none)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.black, lineWidth: 2)
                )
            
            TextField("Email", text: $email)
                .padding()
                .background(Color.white)
                .cornerRadius(25)
                .textContentType(.none)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.black, lineWidth: 2)
                )
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color.white)
                .cornerRadius(25)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.black, lineWidth: 2)
                )

            if logError {
                Text("Missing information")
                    .padding()
                    .foregroundColor(Color.red)
                    .background(Color(red: 0, green: 0, blue: 0, opacity: 0.6))
                    .cornerRadius(20)
                    .font(.system(size: 20, weight: .bold, design: .default))
            }
            Spacer()
            Button(action: {
                if username.isEmpty || email.isEmpty || password.isEmpty {
                    logError = true
                } else {
                    logError = false
                    print("Username: \(username)")
                    print("Email: \(email)")
                    print("Password: \(password)")
                    isUsername = username
                    isLogin.toggle()
                }
            }) {
                Text(isLogin ? "In progress..." : "Creat !")
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color(red: 0.2196, green: 0.7412, blue: 0.6824))
                    .foregroundColor(Color.black)
            }
            .disabled(isLogin)
            .cornerRadius(25)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.black, lineWidth: 2)
            )
            .padding(.top)
        }
        .padding()
        .background(Image("background"))
    }
}

#Preview {
    GestView()
}
