//
//  MangaID.swift
//  DDScan
//
//  Created by Edouard Pradie on 02/11/2024.
//

import Foundation

struct MangaIDResponse: Codable {
    let data: [MangaData]
    
    struct MangaData: Codable {
        let id: String
    }
}

func fetchMangaID(for mangaName: String, completion: @escaping (String?) -> Void) {
    // Formater le nom du manga pour l’URL (remplace les espaces par %20)
    guard let encodedMangaName = mangaName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
        print("Nom du manga invalide")
        completion(nil)
        return
    }

    // Construire l'URL de l'API MangaDex
    let urlString = "https://api.mangadex.org/manga?title=\(encodedMangaName)"
    guard let url = URL(string: urlString) else {
        print("URL invalide")
        completion(nil)
        return
    }
    
    // Créer une tâche de requête pour récupérer les données
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("Erreur lors de la requête : \(error)")
            completion(nil)
            return
        }
        
        guard let data = data else {
            print("Données vides reçues")
            completion(nil)
            return
        }
        
        // Décoder la réponse JSON
        do {
            let response = try JSONDecoder().decode(MangaIDResponse.self, from: data)
            let mangaID = response.data.first?.id
            completion(mangaID) // Renvoyer l'ID du premier manga trouvé
        } catch {
            print("Erreur de décodage JSON : \(error)")
            completion(nil)
        }
    }.resume() // Démarrer la tâche de la requête
}
