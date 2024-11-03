//
//  Scan.swift
//  DDScan
//
//  Created by Edouard Pradie on 20/10/2024.
//

import Foundation

struct Manga : Identifiable {
    let id = UUID()
    
    let name: String
    let description: String?
    let image : String
    let idName : String
}

extension Manga {
    static let list: [Manga] = [
        .init(name: "One Piece", description: "Description 1", image: "Widget 1x1-OnePiece", idName: "One%20Piece"),
        .init(name: "Hunter X Hunter", description: "Description 2", image: "Widget 1x1-HunterXHunter", idName: "Hunter%20X%20Hunter"),
        .init(name: "Jujutsu Kaisen", description: "Description 3", image: "Widget 1x1-JJK", idName: "Jujutsu%20Kaisen"),
        .init(name: "Naruto", description: "Description 4", image: "Widget 1x1-Naruto", idName: "Naruto"),
        .init(name: "Bleach", description: "Description 5", image: "Widget 1x1-Bleach", idName: "Bleach"),
        .init(name: "One Punch Man", description: "Description 6", image: "Widget 1x1-OnePunchMan", idName: "One%20Punch%20Man"),
        .init(name: "Dragon Ball Z", description: "Description 7", image: "Widget 1x1-DragonBallZ", idName: "Dragon%20Ball%20Z"),
        .init(name: "Blue Lock", description: "Description 8", image: "Widget 1x1-BlueLock", idName: "Blue%20Lock"),
    ]
}
