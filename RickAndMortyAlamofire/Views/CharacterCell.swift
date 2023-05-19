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
    
//    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var descriptionLabel: UILabel!
    
    private var titleLabel: UILabel!
    private var descriptionLabel: UILabel!
   // @IBOutlet weak var characterImage: UIImageView!
    private let randomImage: String  =  "https://picsum.photos/200/300"
    
    static let identifier = "characterCell"
    
    func saveModel(character: Result) {
        titleLabel?.text = character.name
        descriptionLabel?.text = character.status

    }
}
