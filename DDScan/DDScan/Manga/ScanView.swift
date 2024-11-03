//
//  ScanView.swift
//  DDScan
//
//  Created by Edouard Pradie on 21/10/2024.
//

import SwiftUI

struct ScanView: View {
    @Binding var mangaName : String
    @Binding var dataChapter : Chapter
    @State private var reverse = false
    @State private var images: [String] = []
    @State private var waitLoading: Int = 0

    var body: some View {
        ScrollView {
            Image("DDScan")
                .resizable()
                .scaledToFit()
                .frame(width:  250.0)
                .padding()

            Text("\(mangaName) - Scan \(dataChapter.chapterNumber)")
                .frame(minWidth: 0, maxWidth: .infinity)
                .foregroundColor(Color.white)
                .font(Font.custom("Audiowide-Regular", size: 25))

            //HStack {
            //    Text("Prev")
            //        .font(Font.custom("Audiowide-Regular", size: 30))
            //        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            //        .padding()
            //        .foregroundColor(Color.white)
            //        .background(Color(red: 0.2196, green: 0.7412, blue: 0.6824))
            //        .cornerRadius(20)
            //    Text("Next")
            //        .font(Font.custom("Audiowide-Regular", size: 30))
            //        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            //        .padding()
            //        .foregroundColor(Color.white)
            //        .background(Color(red: 0.2196, green: 0.7412, blue: 0.6824))
            //        .cornerRadius(20)
            //}
            .padding()
            .background(Color(red: 234 / 255, green: 114 / 255, blue: 74 / 255))
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .cornerRadius(20)
            .padding()

            ForEach(images, id: \.self) { imageUrl in
                ChapterImageView(imageUrl: imageUrl).padding(-4)
            }
        }
        .background(Image("background"))
        .onAppear {
            fetchChapterImages(chapterID: dataChapter.id) { fetchedImages in
                DispatchQueue.main.async {
                    self.images = fetchedImages
                }
            }
        }
    }
}

#Preview {
    ScanView(mangaName: .constant("One Piece"), dataChapter: .constant(Chapter(id: "c4633dd9-7506-4a9f-b229-2e884c7f42ee", chapterNumber: "899")))
}
