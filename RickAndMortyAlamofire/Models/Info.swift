//
//  Info.swift
//  RickAndMortyAlamofire
//
//  Created by Severus Snape on 17.05.2023.
//

import Foundation

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
