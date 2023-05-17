//
//  Network.swift
//  RickAndMortyAlamofire
//
//  Created by Severus Snape on 17.05.2023.
//

import Foundation
import Alamofire


enum ServiceEndPoint: String {
    case BASE_URL = "https://rickandmortyapi.com/api"
    case PATH = "/character"

    static func characterPath() -> String {
        return "\(BASE_URL.rawValue)\(PATH.rawValue)"
    }
}

protocol RmProtocol {
    func fetchData(response: @escaping ([Result]?) -> Void)
}


struct RmService: RmProtocol {

    func fetchData(response: @escaping ([Result]?) -> Void) {
        AF.request(ServiceEndPoint.characterPath()).responseDecodable(of: RmInfo.self) { (model) in
            guard let data = model.value else {
                response(nil)
                return
            }
            response(data.results)
        }
    }

}






