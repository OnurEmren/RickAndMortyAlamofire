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
        let request = RMRequest(endPoint: .character)
        return request.urlString // RMRequest nesnesini string olarak döndürün
    }
}

protocol FetchCharacterProtocol {
    func getData(response: @escaping ([Result]?) -> Void)
}

struct RmService: FetchCharacterProtocol {
    func getData(response: @escaping ([Result]?) -> Void) {
        guard let url = URL(string: ServiceEndPoint.characterUrl()) else {
            response(nil)
            return
        }
        
        AF.request(url).responseDecodable(of: RmInfo.self) { model in
            guard let data = model.value else {
                response(nil)
                return
            }
            response(data.results)
        }
    }
}







