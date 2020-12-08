//
//  AvatarTableViewCell.swift
//  Rick and Morty
//
//  Created by Mac on 08.12.2020.
//

import UIKit

class AvatarTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: AvatarTableViewCell.self)
    private let avatarImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        selectionStyle = .none
        
        contentView.addSubview(avatarImageView)
        contentView.pinToEdges(avatarImageView)
        avatarImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        avatarImageView.contentMode = .scaleAspectFit
    }
    
    func setupAvatar(with image: UIImage) {
        avatarImageView.image = image
    }
}
