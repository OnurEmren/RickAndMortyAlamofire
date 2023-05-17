//
//  ViewController.swift
//  RickAndMortyAlamofire
//
//  Created by Severus Snape on 17.05.2023.
//

import UIKit
import Alamofire

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = RMRequest(endPoint: .character)
        print(request.url)
        
    }

}

