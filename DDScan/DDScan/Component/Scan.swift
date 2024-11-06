//
//  Scan.swift
//  DDScan
//
//  Created by Edouard Pradie on 03/11/2024.
//

import Foundation
import SwiftUI

struct ChapterImageView: View {
    var imageUrl: String

    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
    }
}

func fetchChapterImages(chapterID: String, completion: @escaping ([String]) -> Void) {
    let urlString = "https://api.mangadex.org/at-home/server/\(chapterID)"
    guard let url = URL(string: urlString) else { return }

    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("Erreur lors de la récupération des images : \(error)")
            completion([])
            return
        }

        guard let data = data,
              let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
              let baseUrl = json["baseUrl"] as? String,
              let chapter = json["chapter"] as? [String: Any],
              let pageHashes = chapter["data"] as? [String],
              let chapterHash = chapter["hash"] as? String else {
            completion([])
            return
        }

        let imageUrls = pageHashes.map { "\(baseUrl)/data/\(chapterHash)/\($0)" }
        completion(imageUrls)
    }.resume()
}
