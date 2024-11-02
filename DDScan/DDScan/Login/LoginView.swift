//
//  LoginView.swift
//  DDScan
//
//  Created by Edouard Pradie on 18/10/2024.
//

import SwiftUI

struct LoginView: View {
    @Binding var isUsername : String
    @Binding var isLogin : Bool
    @State private var username = ""
    @State private var password = ""
    @State private var logError = false
    
    var body: some View {
        VStack {
            Image("DDScan")
                .resizable()
                .scaledToFit()
                .frame(width:  250.0)
                .padding()
            Text("Welcome back!")
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
                .autocorrectionDisabled(true)
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
                Text("Missing or incorrect information")
                    .padding()
                    .foregroundColor(Color.red)
                    .background(Color(red: 0, green: 0, blue: 0, opacity: 0.6))
                    .cornerRadius(20)
                    .font(.system(size: 20, weight: .bold, design: .default))
            }
            Spacer()
            Button(action: {
                if username == "Doudou" && password == "oui" {
                    logError = false
                    print("Username: \(username)")
                    print("Password: \(password)")
                    isUsername = username
                    isLogin.toggle()
                } else {
                    logError = true
                }
            }) {
                Text(isLogin ? "In progress..." : "Login")
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
