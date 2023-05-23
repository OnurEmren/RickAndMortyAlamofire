//
//  Cordinator.swift
//  RickAndMortyAlamofire
//
//  Created by Severus Snape on 20.05.2023.
//

import Foundation

public protocol CoordinatorProtocol {
    var parentCoordinator: ParentCoordinatorDelegate? { get set }
}

public protocol ParentCoordinatorDelegate {
    var children: CoordinatorProtocol { get set }
}

