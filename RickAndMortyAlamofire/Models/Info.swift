//
//  Info.swift
//  RickAndMortyAlamofire
//
//  Created by Severus Snape on 18.05.2023.
//

import Foundation

struct Info: Codable {
    let count, pages: Int?
    let next: String?
    let prev: String?
}
