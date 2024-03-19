//
//  Genre.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 19.12.2023.
//

import Foundation



// MARK: - Genre
struct MovieGen: Codable {
    let genres: [GenreElement]?
}

// MARK: - GenreElement
struct GenreElement: Codable {
    let id: Int?
    let name: String?
}
