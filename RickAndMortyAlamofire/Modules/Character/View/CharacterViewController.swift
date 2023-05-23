//
//  CharacterViewController.swift
//  RickAndMortyAlamofire
//
//  Created by Severus Snape on 17.05.2023.
//

import UIKit
import Alamofire
import SnapKit

class CharacterViewController: UIViewController {
    
    var characterTableView: UITableView = UITableView()
    private var nameLabel: UILabel = UILabel()
    private let indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    var characterCell = CharacterCell()
    var viewModel: CharacterViewModelProtocol!
    private var results: [Result] = []
    
    convenience init(viewModel: CharacterViewModelProtocol){
        self.init()
        self.viewModel = viewModel
        self.viewModel.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemYellow
        
        configure()
        viewModel.fetchItems()
    }
    
    //MARK: - Configure the view
    func configure(){
        view.addSubview(nameLabel)
        view.addSubview(characterTableView)
        view.addSubview(indicator)
        
        setCharacterTableView()
        makeTableView()
        makeLabel()
        makeIndicator()
        
    }
    
    
    //MARK: - Set the view
    
    func setCharacterTableView(){
        characterTableView.delegate = self
        characterTableView.dataSource = self
        characterTableView.rowHeight = 210
        characterTableView.register(
            CharacterCell.self,
            forCellReuseIdentifier: CharacterCell.identifier)
        
        DispatchQueue.main.async {
            self.nameLabel.textColor = .black
            self.nameLabel.font = .boldSystemFont(ofSize: 25)
            self.nameLabel.text = "Rick And Morty"
            self.indicator.color = .red
        }
    }
    
    //MARK: Private Methods
    
    private func loadData() {
        guard let viewModel = viewModel else {
            return
        }
        let characters = viewModel.getItems()
        results = characters
        characterTableView.reloadData()
        
    }
}

//MARK: - Extensions

extension CharacterViewController: CharacterViewModelDelegate {
    func handleViewOutput(output: CharacterViewModelOutput) {
        switch output {
        case .setLoading(let isLoading):
            view.isUserInteractionEnabled = !isLoading
            //            indicator.startAnimating()
        case .showAlert: //Alert Model
            print("Show Alert")
        case .finished:
            loadData()
        }
    }
}

extension CharacterViewController {
    private func makeTableView(){
        characterTableView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
            make.left.right.equalTo(nameLabel)
        }
    }
    
    private func makeLabel(){
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.greaterThanOrEqualTo(10)
        }
    }
    
    private func makeIndicator(){
        indicator.snp.makeConstraints { make in
            make.height.equalTo(nameLabel)
            make.right.equalTo(nameLabel).offset(-5)
            make.top.equalTo(nameLabel)
        }
    }
}

//MARK: - Table View

extension CharacterViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: CharacterCell = characterTableView.dequeueReusableCell(
            withIdentifier: CharacterCell.identifier,
            for: indexPath
        ) as? CharacterCell else {
            return UITableViewCell()
        }
        let character = results[indexPath.row]
        cell.saveModel(character: character)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
