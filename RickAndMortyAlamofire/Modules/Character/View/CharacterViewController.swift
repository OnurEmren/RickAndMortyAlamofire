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
    
    //MARK: - Navigate to Detail ViewController
    
    func goToDetail(character: Result) {
        let characterDetailVC = CharacterDetailViewController(character: character)
        navigationController?.pushViewController(characterDetailVC, animated: true)
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
    
    private func deleteData() {
        guard let viewModel = viewModel else {
            return
        }
        
        let deletedCharacter = viewModel.deleteItem()
        results = deletedCharacter
        characterTableView.reloadData()
    }
    
    private func showDeleteAlert() {
        let alertController = UIAlertController(title: "Dikkat", message: "Bu karakteri silmek istediğinize emin misiniz?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Evet", style: UIAlertAction.Style.default) {
            UIAlertAction in
        }
        
        let cancelAction = UIAlertAction(title: "Vazgeç", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
        }
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
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
        case .delete:
            deleteData()
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

//MARK: - Table View Extensions

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
        let selectedCharacter = results[indexPath.row]
        goToDetail(character: selectedCharacter)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alertController = UIAlertController(
                title: "Dikkat",
                message: "Bu öğeyi silmek istediğinizden emin misiniz?",
                preferredStyle: .alert
            )
            
            let deleteAction = UIAlertAction(
                title: "Sil",
                style: .destructive
            ) { [weak self] _ in
                guard let self = self else { return }
                
                self.results.remove(at: indexPath.row)
                self.characterTableView.deleteRows(at: [indexPath], with: .fade)
            }
            
            alertController.addAction(deleteAction)
            
            let cancelAction = UIAlertAction(
                title: "İptal",
                style: .cancel,
                handler: nil
            )
            
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
        }
    }

}
