//
//  CharacterCell.swift
//  RickAndMortyAlamofire
//
//  Created by Severus Snape on 19.05.2023.
//

import Foundation
import AlamofireImage
import UIKit

class CharacterCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    private let randomImage = ""
    static let identifier = "characterCell"
    
    func saveModel(character: Result) {
        nameLabel?.text = character.name
        descriptionLabel?.text = character.status
        characterImage.af.setImage(
            withURL:
                URL(string: character.image ?? randomImage) ?? URL(string: randomImage)!
        )
    }
}
