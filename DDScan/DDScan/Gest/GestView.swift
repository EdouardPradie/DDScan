//
//  GestView.swift
//  DDScan
//
//  Created by Edouard Pradie on 19/10/2024.
//

import SwiftUI

struct GestView: View {
    @State private var isUsername = ""
    @State private var isLogin = false

    var body: some View {
        if (isLogin) {
            HomeView(mangas: Manga.list ,isUsername: $isUsername)
        } else {
            WelcomeView(isLogin: $isLogin, isUsername: $isUsername)
        }
    }
}

#Preview {
    GestView()
}
