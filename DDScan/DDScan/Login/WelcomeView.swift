//
//  WelcomeView.swift
//  DDScan
//
//  Created by Edouard Pradie on 18/10/2024.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var isLogin : Bool
    @Binding var isUsername : String
    @State private var creat = false
    @State private var login = false

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image("DDScan")
                    .resizable()
                    .scaledToFit()
                    .frame(width:  250.0)
                    .padding()
                Spacer()
                Spacer()
                
                NavigationLink(destination: CreatView(isUsername: $isUsername, isLogin: $isLogin)) {
                    Text("Create an account")
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.white)
                        .foregroundColor(Color.black)
                }
                .disabled(creat)
                .cornerRadius(25)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.black, lineWidth: 2)
                )
                .padding(.top)

                NavigationLink(destination: LoginView(isUsername: $isUsername, isLogin: $isLogin)) {
                    Text("Login")
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.white)
                        .foregroundColor(Color.black)
                }
                .disabled(login)
                .cornerRadius(25)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.black, lineWidth: 2)
                )
                .padding(.top)

                Spacer()
            }
            .padding()
            .background(Image("background"))
        }
    }
}

#Preview {
    GestView()
}
