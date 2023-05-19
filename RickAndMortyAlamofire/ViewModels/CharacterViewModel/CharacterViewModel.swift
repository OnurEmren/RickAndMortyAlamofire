//
//  CharacterViewModel.swift
//  RickAndMortyAlamofire
//
//  Created by Severus Snape on 18.05.2023.
//

import Foundation

protocol RickAndMortyProtocol{
    var rickAndMortyCharacters: [Result] { get set }
    var rickyAndMortyServices: FetchCharacterProtocol { get }
    var rickAndMortyOutput: OutputCharacters? { get }
    
    func setDelegate(output: OutputCharacters)
    func fetchItems()
}

final class CharacterViewModel: RickAndMortyProtocol {
    
    var rickAndMortyOutput: OutputCharacters?
    var rickAndMortyCharacters: [Result] = []
    var rickyAndMortyServices: FetchCharacterProtocol
    
    init() {
        rickyAndMortyServices = RmService()
    }
    
    func setDelegate(output: OutputCharacters) {
        rickAndMortyOutput = output
    }
    
    func fetchItems() {
        rickyAndMortyServices.getData { [weak self] response in
            self?.rickAndMortyCharacters = response ?? []
            self?.rickAndMortyOutput?.getCharactersData(values: self?.rickAndMortyCharacters ?? [])
        }
    }
}
