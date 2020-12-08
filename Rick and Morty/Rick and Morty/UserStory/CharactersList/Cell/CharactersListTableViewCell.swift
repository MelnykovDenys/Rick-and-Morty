//
//  CharactersListTableViewCell.swift
//  Rick and Morty
//
//  Created by Mac on 07.12.2020.
//

import UIKit

final class CharactersListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImageView.image = nil
    }
    
    func configure(with character: Character) {
        nameLabel.text = "Name: ".localized + character.name
        genderLabel.text = "Gender: ".localized + character.gender
        speciesLabel.text = "Species: ".localized + character.species
    }
    
    func updateAvatar(with image: UIImage) {
        avatarImageView.image = image
    }
}
