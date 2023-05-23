//
//  CharacterCoordinator.swift
//  RickAndMortyAlamofire
//
//  Created by Severus Snape on 20.05.2023.
//

import UIKit


final class CharacterCoordinator: CharacterCoordinatorDelegate {
    
    var parentCoordinator: ParentCoordinatorDelegate?
    private(set) var rootViewController: UINavigationController!
    private let factory = CharacterFactory()
    
    func start() {
        rootViewController = factory.buildCharacterViewController(delegate: self)
    }
}
