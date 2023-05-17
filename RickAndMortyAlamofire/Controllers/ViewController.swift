//
//  ViewController.swift
//  RickAndMortyAlamofire
//
//  Created by Severus Snape on 17.05.2023.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    let rmService = RmService()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        rmService.getData { results in
                 // Callback ile dönen sonuçları kontrol et
                 if let results = results {
                     // Verileri başarılı bir şekilde aldık, kullanabiliriz
                     print(results)
                 } else {
                     // Veri alınırken bir hata oluştu veya veri boş geldi
                     print("Veri alınamadı veya boş geldi.")
                 }
             }
        
        let request = RMRequest(endPoint: .character)
        print(request.url)
        
    }

}

