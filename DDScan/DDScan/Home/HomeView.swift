//
//  HomeView.swift
//  DDScan
//
//  Created by Edouard Pradie on 17/10/2024.
//

import SwiftUI

struct HomeView: View {
    var mangas : [Manga]
    @Binding var isUsername : String

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                Image("DDScan")
                    .resizable()
                    .scaledToFit()
                    .frame(width:  250.0)
                    .padding()
                
                Text("Welcome \(isUsername)")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .font(Font.custom("Audiowide-Regular", size: 35))
                
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(mangas, id: \.id) { manga in
                        NavigationLink(destination: MangaView(manga: .constant(manga))) {
                                MangaItemView(manga: manga)
                                    .frame(minWidth: 0, minHeight: 200, alignment: .top)
                                        .background(Color.clear)
                        }
                    }
                }
                .padding()
            }
            .background(Image("background"))
        }
    }
}

struct MangaItemView: View {
    let manga : Manga

    var body: some View {
        VStack {
            Image(manga.image)
                .resizable()
                .scaledToFit()
                .frame(width:  100.0)
                .padding(.top)
            Text(manga.name)
                .frame(minWidth: 0, maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.white)
                .font(Font.custom("Audiowide-Regular", size: 25))
        }
    }
}

#Preview {
    HomeView(mangas: Manga.list ,isUsername: .constant("Doudou"))
}
