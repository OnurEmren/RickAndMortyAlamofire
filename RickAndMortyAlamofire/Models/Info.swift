//
//  Info.swift
//  RickAndMortyAlamofire
//
//  Created by Onur Emren on 18.05.2023.
//

import Foundation

struct Info: Codable {
    let count, pages: Int?
    let next: String?
    let prev: String?
}
