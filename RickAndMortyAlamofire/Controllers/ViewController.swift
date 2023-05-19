//
//  ViewController.swift
//  RickAndMortyAlamofire
//
//  Created by Severus Snape on 17.05.2023.
//

import UIKit
import Alamofire

protocol OutputCharacters {
    func getCharactersData(values: [Result])
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var characterTableView: UITableView!
    lazy var viewModel: RickAndMortyProtocol = CharacterViewModel()
    private var results: [Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.characterTableView.delegate = self
        self.characterTableView.dataSource = self
        viewModel.setDelegate(output: self)
        viewModel.fetchItems()
    }
    
    //MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell: CharacterCell = tableView.dequeueReusableCell(withIdentifier: CharacterCell.identifier) as? CharacterCell
        else {
            return UITableViewCell()
        }
        
        cell.saveModel(character: results[indexPath.row])
        let nameResult = results[indexPath.row]
        cell.textLabel?.text = nameResult.name
        cell.detailTextLabel?.text = nameResult.status
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

//MARK: - Extensions
// Protocolü View Controllera ekliyoruz.
extension ViewController: OutputCharacters {
    func getCharactersData(values: [Result]) {
        results = values
        characterTableView.reloadData()
    }
}
