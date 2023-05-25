//
//  CharacterDetailViewController.swift
//  RickAndMortyAlamofire
//
//  Created by Severus Snape on 19.05.2023.
//

import UIKit
import SnapKit
import AlamofireImage

final class CharacterDetailViewController: UIViewController {
    
    private let detailView = CharacterDetailUIView()
    private let character: Result
    private var nameLabel: UILabel = UILabel()
    private var statusLabel: UILabel = UILabel()
    
    init(character: Result) {
        self.character = character
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDetailView()
        fillData()
    }
    
    private func configureDetailView() {
        view.addSubview(detailView)
        view.addSubview(nameLabel)
        view.addSubview(statusLabel)
        
        makeLabel()
        makeStatusLabel()
        detailScreen()
        makeGenderLabel()
        makeOriginLabel()
        makeEpisodeLabel()
        makeImage()
    }
    
    private func fillData() {
        detailView.detailNameLabel.text = character.name
        detailView.statusLabel.text = character.status
        detailView.genderLabel.text = character.gender?.rawValue
        detailView.originLabel.text = character.origin?.name
        if let episodes = character.episode {
            let episodes = episodes.count
            detailView.episodeLabel.text = "\(episodes)"
        }
        if let imageURLString = character.image,
           let imageURL = URL(string: imageURLString) {
            detailView.detailImage.af.setImage(withURL: imageURL)
        }
    }
}

extension CharacterDetailViewController {
    private func detailScreen() {
        detailView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func makeLabel() {
        detailView.detailNameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(view).offset(20)
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
    }
    private func makeStatusLabel() {
        detailView.statusLabel.snp.makeConstraints { make in
            make.top.equalTo(detailView.detailImage.snp.bottom).offset(10)
            make.left.equalTo(detailView.detailNameLabel.snp.right).offset(20)
            make.height.equalTo(100)
            make.width.equalTo(130)
        }
    }
    
    private func makeGenderLabel() {
        detailView.genderLabel.snp.makeConstraints { make in
            make.top.equalTo(detailView.statusLabel.snp.bottom).offset(10)
            make.left.equalTo(detailView).offset(20)
            make.right.equalTo(detailView).offset(-20)
            make.height.equalTo(50)
        }
    }
    
    private func makeOriginLabel() {
        detailView.originLabel.snp.makeConstraints { make in
            make.top.equalTo(detailView.genderLabel.snp.bottom).offset(10)
            make.left.equalTo(detailView).offset(20)
            make.right.equalTo(detailView).offset(-20)
            make.height.equalTo(50)
        }
    }
    
    private func makeEpisodeLabel() {
        detailView.episodeLabel.snp.makeConstraints { make in
            make.top.equalTo(detailView.originLabel.snp.bottom).offset(10)
            make.left.equalTo(detailView).offset(20)
            make.right.equalTo(detailView).offset(-20)
            make.height.equalTo(50)
        }
    }
    
    private func makeImage() {
        detailView.detailImage.snp.makeConstraints { make in
            make.left.equalTo(detailView).offset(20)
            make.right.equalTo(detailView).offset(-20)
            make.height.equalTo(400)
            
        }
    }
}
