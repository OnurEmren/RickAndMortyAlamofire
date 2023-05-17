//
//  Network.swift
//  RickAndMortyAlamofire
//
//  Created by Severus Snape on 17.05.2023.
//

import Foundation
import Alamofire

class ServiceEndPoint {
    static func characterUrl() -> String {
        return "\(RMRequest(endPoint: .character))"
    }
}

protocol FetchCharacterProtocol {
    func getData(response: @escaping ([Result]?) -> Void)
}

struct RmService: FetchCharacterProtocol {
    func getData(response: @escaping ([Result]?) -> Void) {
        AF.request(ServiceEndPoint.characterUrl()).responseDecodable(of: RmInfo.self) { model in
            guard let data = model.value else {
                response(nil)
                return
            }
            response(data.results)
        }
    }
}






