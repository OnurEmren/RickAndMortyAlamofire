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
        return request.urlString
    }
}

protocol FetchCharacterProtocol {
    func getData(response: @escaping ([Result]?) -> Void)
}

//Fetch Character Data
struct RmService: FetchCharacterProtocol {
    func getData(response: @escaping ([Result]?) -> Void) {
        //Check url nil or not
        guard let url = URL(string: ServiceEndPoint.characterUrl()) else {
            response(nil)
            return
        }
        //Request data
        AF.request(url).responseDecodable(of: RMResponse.self) { model in
            guard let data = model.value else {
                response(nil)
                return
            }
            response(data.results)
        }
    }
}







