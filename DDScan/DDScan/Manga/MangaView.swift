//
//  MangaView.swift
//  DDScan
//
//  Created by Edouard Pradie on 21/10/2024.
//

import SwiftUI

struct MangaView: View {
    @Binding var manga : Manga
    @State private var dataChapters : [Chapter] = []
    @State private var rev : Bool = true
    @State private var mangaID = ""

    var body: some View {
        NavigationView {
            VStack {
                Image("DDScan")
                    .resizable()
                    .scaledToFit()
                    .frame(width:  250.0)
                    .padding()
                
                Text(manga.name)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .font(Font.custom("Audiowide-Regular", size: 35))
                
                ScrollView {
                    Button(action: {
                        dataChapters.reverse()
                        rev.toggle()
                    }) {
                        Text("Reverse")
                            .font(Font.custom("Audiowide-Regular", size: 15))
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color(red: 0.2196, green: 0.7412, blue: 0.6824))
                            .cornerRadius(20)
                    }
                    HStack {
                        if let firstChapter = rev ? dataChapters.last : dataChapters.first {
                            NavigationLink(destination: ScanView(
                                mangaName: .constant(manga.name),
                                dataChapter: .constant(firstChapter)
                            )) {
                                Text("Start")
                                    .font(Font.custom("Audiowide-Regular", size: 30))
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    .padding()
                                    .foregroundColor(Color.white)
                                    .background(Color(red: 0.2196, green: 0.7412, blue: 0.6824))
                                    .cornerRadius(20)
                            }
                        }
                        if let lastChapter = rev ? dataChapters.first : dataChapters.last {
                            NavigationLink(destination: ScanView(
                                mangaName: .constant(manga.name),
                                dataChapter: .constant(lastChapter)
                            )) {
                                Text("Last")
                                    .font(Font.custom("Audiowide-Regular", size: 30))
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    .padding()
                                    .foregroundColor(Color.white)
                                    .background(Color(red: 0.2196, green: 0.7412, blue: 0.6824))
                                    .cornerRadius(20)
                            }
                        }
                    }
                    .padding()
                    .background(Color(red: 234 / 255, green: 114 / 255, blue: 74 / 255))
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .cornerRadius(20)

                    ForEach(dataChapters, id: \.id) { scan in
                        NavigationLink(destination: ScanView(mangaName: .constant(manga.name), dataChapter: .constant(scan))) {
                            Text("Scan \(scan.chapterNumber)")
                                .font(Font.custom("Audiowide-Regular", size: 30))
                                .frame(minWidth: 0, maxWidth: 250, alignment: .leading)
                                .padding()
                                .foregroundColor(Color.white)
                                .background(Color(red: 0.2196, green: 0.7412, blue: 0.6824))
                                .cornerRadius(20)
                        }
                    }
                }
                .padding()
            }
            .background(Image("background"))
        }
        .onAppear {
            fetchMangaID(for: manga.name) { id in
                if let id = id {
                    fetchChapters(for: id) { chapters in
                        if let data = chapters {
                            dataChapters = data
                            dataChapters.reverse()
                        } else {
                            print("Impossible de récupérer le nombre de chapitres pour \(manga.name)")
                            }
                    }
                } else { 
                    print("Impossible de récupérer l'ID du manga")
                }
            }
        }
    }
}

#Preview {
    MangaView(manga: .constant(Manga.list.first ?? Manga(name: "Default", description: "", image: "", idName: "")))
}
