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

protocol RmServiceProtocol {
    func getData(response: @escaping ([Result]?) -> Void)
    func deleteData(_ item: [Result], completion: @escaping (Bool) -> Void)
}

struct RmService: RmServiceProtocol {
    
    func getData(response: @escaping ([Result]?) -> Void) {
        guard let url = URL(string: ServiceEndPoint.characterUrl()) else {
            response(nil)
            return
        }
        AF.request(url).responseDecodable(of: RMResponse.self) { model in
            guard let data = model.value else {
                response(nil)
                return
            }
            response(data.results)
        }
    }
    
    func deleteData(_ item: [Result], completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "\(ServiceEndPoint.characterUrl())/\(item)") else {
            completion(false)
            return
        }
        
        AF.request(url, method: .delete).response { response in
            completion(response.error == nil)
        }
    }
}







