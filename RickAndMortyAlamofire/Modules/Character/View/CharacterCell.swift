//
//  CharacterCell.swift
//  RickAndMortyAlamofire
//
//  Created by Severus Snape on 19.05.2023.
//

import Foundation
import AlamofireImage
import UIKit
import SnapKit

class CharacterCell: UITableViewCell {
    
    enum Constants {
        static let nameLabelPadding = 10
        static let nameLabelHeight = 10
        static let nameLabelFontSize = 18.0
        static let minusNameLabelHeight = -10
        static let statusLabelPadding = 10
        static let minusStatusLabelPadding = -10
        static let statusLabelFontSize = 16.0
        static let verticalStackViewCornerRadius = 20.0
        static let verticalStackViewPadding = 10.0
        static let minusVerticalStackViewPadding = -10.0
        static let imageBorderSize = 3.0
        static let imagePadding = 10.0
        static let minusImagePadding = -10
        static let myViewPadding = 5.0
        static let myViewBorder = 1.0
        static let minusMyViewPadding = -5.0
    }
    
    private let nameLabel: UILabel = UILabel()
    private let statusLabel: UILabel = UILabel()
    private let myView: UIView = UIView()
    private let indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    private let characterImage: UIImageView = UIImageView()
    private let randomImage = ""
    private let verticalStackview: UIStackView = {
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        return verticalStackView
    }()
    static let identifier = "characterCell"

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        backgroundColor = .systemYellow
        addSubview(nameLabel)
        addSubview(characterImage)
        addSubview(myView)
        addSubview(verticalStackview)
        
        setNameLabel()
        setStatusLabel()
        setMyView()
        setVerticalStackView()
        setCharacterImage()
        
        myView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(Constants.myViewPadding)
            make.right.equalToSuperview().offset(Constants.minusMyViewPadding)
            make.height.equalTo(200)
        }
        
        verticalStackview.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(Constants.minusVerticalStackViewPadding)
            make.left.equalTo(characterImage.snp.right).offset(Constants.verticalStackViewPadding)
            make.centerY.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        characterImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Constants.imagePadding)
            make.bottom.equalToSuperview().offset(Constants.minusImagePadding)
            make.left.equalToSuperview().offset(Constants.imagePadding)
            make.width.equalTo(160)
        }
    }
    
    private func setNameLabel() {
        nameLabel.backgroundColor = .systemYellow
        nameLabel.textAlignment = .center
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nameLabel.font = UIFont.boldSystemFont(ofSize: Constants.nameLabelFontSize)
    }
    
    private func setStatusLabel() {
        statusLabel.backgroundColor = .systemYellow
        statusLabel.textAlignment = .center
    }
    
    private func setMyView() {
        myView.backgroundColor = .systemYellow
        myView.layer.borderWidth = Constants.myViewBorder
        myView.layer.borderColor = UIColor.systemOrange.cgColor
        myView.layer.masksToBounds = true
        myView.addSubview(characterImage)
        myView.addSubview(verticalStackview)
    }
    
    private func setVerticalStackView() {
        verticalStackview.addArrangedSubview(nameLabel)
        verticalStackview.addArrangedSubview(statusLabel)
        verticalStackview.layer.borderWidth = Constants.imageBorderSize
        verticalStackview.layer.borderColor = UIColor.systemOrange.cgColor
        verticalStackview.layer.cornerRadius = Constants.verticalStackViewCornerRadius
        verticalStackview.layer.masksToBounds = true
    }
    
    private func setCharacterImage() {
        characterImage.layer.borderWidth = Constants.imageBorderSize
        characterImage.layer.borderColor = UIColor.systemOrange.cgColor
        characterImage.layer.cornerRadius = Constants.verticalStackViewCornerRadius
        characterImage.layer.masksToBounds = true
    }
    
    func saveModel(character: Result) {
        nameLabel.text = character.name
        statusLabel.text = character.status
        characterImage.af.setImage(
            withURL:
                URL(string: character.image ?? randomImage) ?? URL(string: randomImage)!
        )
    }
}
