//
//  RMResults.swift
//  RickAndMortyAlamofire
//
//  Created by Severus Snape on 18.05.2023.
//

import Foundation

struct RMResponse: Codable {
    let info: Info?
    let results: [Result]?
}

//Add Error
