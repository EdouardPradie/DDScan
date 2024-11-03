//
//  ChapterCount.swift
//  DDScan
//
//  Created by Edouard Pradie on 02/11/2024.
//

import Foundation

struct Chapter: Identifiable {
    let id: String
    let chapterNumber: String
}

func fetchChapters(for mangaID: String, completion: @escaping ([Chapter]?) -> Void) {
    let urlString = "https://api.mangadex.org/chapter?manga=\(mangaID)&translatedLanguage[]=es"
    
    guard let url = URL(string: urlString) else {
        completion(nil)
        return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Erreur lors de la requête : \(error.localizedDescription)")
            completion(nil)
            return
        }
        
        guard let data = data else {
            completion(nil)
            return
        }
        
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                let dataArray = json["data"] as? [[String: Any]] {
                let chapters = dataArray.compactMap { item -> Chapter? in
                    guard let id = item["id"] as? String,
                            let attributes = item["attributes"] as? [String: Any],
                            let chapterNumber = attributes["chapter"] as? String else {
                        return nil
                    }
                    return Chapter(id: id, chapterNumber: chapterNumber)
                }
                completion(chapters)
            } else {
                completion(nil)
            }
        } catch {
            print("Erreur lors de la désérialisation JSON : \(error.localizedDescription)")
            completion(nil)
        }
    }
    
    task.resume()
}
