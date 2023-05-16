//
//  ViewController.swift
//  RickAndMortyAlamofire
//
//  Created by Severus Snape on 17.05.2023.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let BASE_URL = "https://rickandmortyapi.com/api/character"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchRequest()
        
    }
    
    func fetchRequest(){
        AF.request(BASE_URL).responseJSON { response in
                switch response.result {
                case .success(let responseData):
                    print("İstek başarılı. Yanıt: \(responseData)")
                case .failure(let error):
                    print("İstek başarısız: \(error)")
                }
            }
    }
    
}

