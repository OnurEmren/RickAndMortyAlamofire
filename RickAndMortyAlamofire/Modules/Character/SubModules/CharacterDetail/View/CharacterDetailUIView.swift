//
//  CharacterDetailUIView.swift
//  RickAndMortyAlamofire
//
//  Created by Severus Snape on 23.05.2023.
//

import UIKit
import SnapKit
import AlamofireImage

class CharacterDetailUIView: UIView {
    
    let detailView: UIView = UIView()
    let detailImage: UIImageView = UIImageView()
    let detailNameLabel: UILabel = UILabel()
    let statusLabel: UILabel = UILabel()
    let genderLabel: UILabel = UILabel()
    let originLabel: UILabel = UILabel()
    let episodeLabel: UILabel = UILabel()
    let randomImage = ""
    
    let verticalStackview: UIStackView = {
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        return verticalStackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureDetailView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    enum DetailConstants {
        static let labelPadding = 10
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
        static let imagePadding = 50.0
        static let minusImagePadding = -10
        static let myViewPadding = 5.0
        static let myViewBorder = 1.0
        static let minusMyViewPadding = -5.0
    }
    
    
    func configureDetailView(){
        
        backgroundColor = .systemPink
       
        addSubview(detailView)
        addSubview(verticalStackview)
        addSubview(detailNameLabel)
        addSubview(statusLabel)
        addSubview(genderLabel)
        addSubview(originLabel)
        addSubview(episodeLabel)
        addSubview(detailImage)

        setMyView()
        setVerticalStackView()
        setCharacterImage()
        setLabel()
        setStatusLabel()
        setGenderLabel()
        setOriginLabel()
        setEpisodeLabel()
        
        detailView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        verticalStackview.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(-10)
        }

        detailNameLabel.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.width.equalTo(250)
        }

        statusLabel.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.width.equalTo(150)
        }

        genderLabel.snp.makeConstraints { make in
            make.height.equalTo(50)
        }

        originLabel.snp.makeConstraints { make in
            make.height.equalTo(50)
        }

        episodeLabel.snp.makeConstraints { make in
            make.height.equalTo(50)
        }

        detailImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalTo(detailNameLabel.snp.top).offset(-10)
            make.left.right.equalToSuperview().offset(DetailConstants.imagePadding)
            make.height.equalTo(400)
        }
    }
    
    private func setMyView() {
        detailView.backgroundColor = .systemYellow
        detailView.layer.borderWidth = DetailConstants.myViewBorder
        detailView.addSubview(verticalStackview)
    }
    
    private func setVerticalStackView() {
        verticalStackview.axis = .vertical
        verticalStackview.addArrangedSubview(detailImage)
        verticalStackview.alignment = .center
        verticalStackview.distribution = .fill
        verticalStackview.spacing = 10
        verticalStackview.layer.borderWidth = DetailConstants.imageBorderSize
        verticalStackview.layer.borderColor = UIColor.systemOrange.cgColor
        verticalStackview.backgroundColor = .systemPink
        verticalStackview.layer.cornerRadius = DetailConstants.verticalStackViewCornerRadius
        verticalStackview.layer.masksToBounds = true
    }
    
    private func setLabel() {
        detailNameLabel.backgroundColor = .black
        detailNameLabel.textAlignment = .center
        detailNameLabel.numberOfLines = 2
        detailNameLabel.textColor = .white
        detailNameLabel.font = UIFont.boldSystemFont(ofSize: DetailConstants.nameLabelFontSize)
        detailNameLabel.layer.cornerRadius = DetailConstants.verticalStackViewCornerRadius
        detailNameLabel.layer.masksToBounds = true
    }
    
    private func setStatusLabel() {
        statusLabel.backgroundColor = .systemYellow
        statusLabel.textAlignment = .center
        statusLabel.font = UIFont.boldSystemFont(ofSize: DetailConstants.statusLabelFontSize)
        statusLabel.layer.cornerRadius = DetailConstants.verticalStackViewCornerRadius
        statusLabel.layer.masksToBounds = true
    }
    
    private func setGenderLabel() {
        genderLabel.backgroundColor = .systemYellow
        genderLabel.textAlignment = .center
        genderLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        genderLabel.font = UIFont.boldSystemFont(ofSize: DetailConstants.statusLabelFontSize)
        genderLabel.layer.cornerRadius = DetailConstants.verticalStackViewCornerRadius
        genderLabel.layer.masksToBounds = true
    }
    
    private func setOriginLabel() {
        originLabel.backgroundColor = .systemYellow
        originLabel.textAlignment = .center
        originLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        originLabel.font = UIFont.boldSystemFont(ofSize: DetailConstants.statusLabelFontSize)
        originLabel.layer.cornerRadius = DetailConstants.verticalStackViewCornerRadius
        originLabel.layer.masksToBounds = true
    }
    
    private func setEpisodeLabel() {
        episodeLabel.backgroundColor = .systemYellow
        episodeLabel.textAlignment = .center
        episodeLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        episodeLabel.font = UIFont.boldSystemFont(ofSize: DetailConstants.statusLabelFontSize)
        episodeLabel.layer.cornerRadius = DetailConstants.verticalStackViewCornerRadius
        episodeLabel.layer.masksToBounds = true
    }
    
    
    private func setCharacterImage() {
        detailImage.backgroundColor = .systemYellow
        detailImage.layer.borderWidth = DetailConstants.imageBorderSize
        detailImage.layer.borderColor = UIColor.systemOrange.cgColor
        detailImage.layer.cornerRadius = DetailConstants.verticalStackViewCornerRadius
        detailImage.layer.masksToBounds = true
    }
}
