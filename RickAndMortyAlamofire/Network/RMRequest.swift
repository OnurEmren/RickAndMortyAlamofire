//
//  RMEndPoint.swift
//  RickAndMortyAlamofire
//
//  Created by Severus Snape on 17.05.2023.
//

import Foundation


struct RMRequest {
    
    private struct Constants {
        static let BASE_URL = "https://rickandmortyapi.com/api"
        static let PATH = RMRequest(endPoint: .character)
    }
    
    private let endPoint: EndPoint
    private let pathComponents: [String]
    
    public init(
        endPoint: EndPoint,
        pathComponents: [String] = []
    ) {
        self.endPoint = endPoint
        self.pathComponents = pathComponents
    }
    public var urlString: String {
        var string = Constants.BASE_URL
        string += "/"
        string += endPoint.rawValue
        
        if !pathComponents.isEmpty{
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        return string
    }
    public var url: URL? {
        return URL(string: urlString)
    }
}

