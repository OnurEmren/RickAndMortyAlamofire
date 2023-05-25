//
//  CharacterContracts.swift
//  RickAndMortyAlamofire
//
//  Created by Severus Snape on 20.05.2023.
//

import Foundation

protocol CharacterCoordinatorDelegate {
    func start()
}

protocol CharacterViewModelProtocol {
    var delegate: CharacterViewModelDelegate? { get set }
    var coordinatorDelegate: CharacterCoordinatorDelegate? { get }
    var rickAndMortyCharacters: [Result] { get set }
    
    func getItems() -> [Result]
    func fetchItems()
    func deleteCharacter()
    func deleteItem() -> [Result]
}

protocol CharacterViewModelDelegate {
    func handleViewOutput(output: CharacterViewModelOutput)
}

enum CharacterViewModelOutput {
    case setLoading(Bool)
    case showAlert
    case finished
    case delete(Bool)
}
