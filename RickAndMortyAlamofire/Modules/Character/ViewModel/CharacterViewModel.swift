//
//  CharacterViewModel.swift
//  RickAndMortyAlamofire
//
//  Created by Severus Snape on 18.05.2023.
//

import Foundation

final class CharacterViewModel: CharacterViewModelProtocol {
  
    
  
    
  
    var rickAndMortyCharacters: [Result] = []
    var coordinatorDelegate: CharacterCoordinatorDelegate?
    var delegate: CharacterViewModelDelegate?
    private let rickAndMortyService: RmServiceProtocol
    
    init(rickAndMortyService: RmServiceProtocol) {
        self.rickAndMortyService = rickAndMortyService
    }
    
    func fetchItems() {
        delegate?.handleViewOutput(output: .setLoading(true))
        rickAndMortyService.getData { [weak self] response in
            guard let self = self else {
                return
            }
            self.delegate?.handleViewOutput(output: .setLoading(false))
            self.rickAndMortyCharacters = response ?? []
            self.delegate?.handleViewOutput(output: .finished)
        }
    }
    
    func deleteCharacter() {
        delegate?.handleViewOutput(output: .delete(true))
        rickAndMortyService.deleteData(rickAndMortyCharacters) {[weak self] deletedData in
            guard let self = self else {
                return
            }
            self.delegate?.handleViewOutput(output: .delete(true))
            self.delegate?.handleViewOutput(output: .finished)
        }
    }
    
    func deleteItem() -> [Result] {
        rickAndMortyCharacters
    }
    
    func getItems() -> [Result] {
        rickAndMortyCharacters
    }
}
