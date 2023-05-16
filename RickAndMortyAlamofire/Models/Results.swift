//
//  Results.swift
//  RickAndMortyAlamofire
//
//  Created by Severus Snape on 17.05.2023.
//

import Foundation

struct Results: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
