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
}

extension Manga {
    static let list: [Manga] = [
        .init(name: "One Piece", description: "Description 1", image: "Widget 1x1-OnePiece"),
        .init(name: "Hunter X Hunter", description: "Description 2", image: "Widget 1x1-HunterXHunter"),
        .init(name: "Jujutsu Kaisen", description: "Description 3", image: "Widget 1x1-JJK"),
        .init(name: "Naruto", description: "Description 4", image: "Widget 1x1-Naruto"),
        .init(name: "Bleach", description: "Description 5", image: "Widget 1x1-Bleach"),
        .init(name: "One Punch Man", description: "Description 6", image: "Widget 1x1-OnePunchMan"),
        .init(name: "Dragon Ball Z", description: "Description 7", image: "Widget 1x1-DragonBallZ"),
        .init(name: "Blue Lock", description: "Description 8", image: "Widget 1x1-BlueLock"),
    ]
}

struct ScanID : Identifiable {
    let id = UUID()
    
    let num: Int
    let description: String?
}

extension ScanID {
static let list: [ScanID] = [
    .init(num: 1, description: "Description 1"),
    .init(num: 2, description: "Description 2"),
    .init(num: 3, description: "Description 3"),
    .init(num: 4, description: "Description 4"),
    .init(num: 5, description: "Description 5"),
    .init(num: 6, description: "Description 6"),
    .init(num: 7, description: "Description 7"),
    .init(num: 8, description: "Description 8"),
    .init(num: 9, description: "Description 9"),
    .init(num: 10, description: "Description 10"),
    .init(num: 11, description: "Description 11"),
    .init(num: 12, description: "Description 12"),
]
}
