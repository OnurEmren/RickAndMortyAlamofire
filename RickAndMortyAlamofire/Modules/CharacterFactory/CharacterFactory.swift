//
//  CharacterFactory.swift
//  RickAndMortyAlamofire
//
//  Created by Severus Snape on 21.05.2023.
//

import Foundation
import UIKit

final class CharacterFactory {
    
    func buildCharacterViewController(delegate: CharacterCoordinatorDelegate) -> UINavigationController {
        
        let characterService = RmService()
        let characterViewModel = CharacterViewModel(rickAndMortyService: characterService)
        characterViewModel.coordinatorDelegate = delegate
        let characterViewController = CharacterViewController(viewModel: characterViewModel)
        let navigationController = UINavigationController(rootViewController: characterViewController)
        
        return navigationController
    }
}

