//
//  CharacterResult.swift
//  RickAndMortyAlamofire
//
//  Created by Severus Snape on 17.05.2023.
//

import Foundation

// MARK: - Result

struct Result: Codable {
    let id: Int?
    let name: String?
    let status: String?
    let species: Species?
    let type: String?
    let gender: Gender?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

