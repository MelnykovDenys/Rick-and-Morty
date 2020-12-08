//
//  NameTableViewCell.swift
//  Rick and Morty
//
//  Created by Mac on 08.12.2020.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: DescriptionTableViewCell.self)
    
    private let nameLabel = UILabel()
    private let originLabel = UILabel()
    private let locationLabel = UILabel()
    private let createdLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        selectionStyle = .none
        
        contentView.addSubview(nameLabel)
        nameLabel.numberOfLines = 0
        nameLabel.font = .boldSystemFont(ofSize: 20)
        nameLabel.textAlignment = .center
        nameLabel.textColor = #colorLiteral(red: 1, green: 0.2756245587, blue: 0.3160831999, alpha: 1)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10)
        ])
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(locationLabel)
        locationLabel.numberOfLines = 0
        locationLabel.font = .systemFont(ofSize: 16)
        locationLabel.textAlignment = .left
        locationLabel.textColor = #colorLiteral(red: 0.5461897921, green: 0.2824049212, blue: 1, alpha: 1)
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            locationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            locationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10)
        ])
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(originLabel)
        originLabel.numberOfLines = 0
        originLabel.font = .systemFont(ofSize: 16)
        originLabel.textAlignment = .left
        originLabel.textColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        NSLayoutConstraint.activate([
            originLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor),
            originLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            originLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10)
        ])
        originLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(createdLabel)
        createdLabel.numberOfLines = 0
        createdLabel.font = .italicSystemFont(ofSize: 16)
        createdLabel.textAlignment = .left
        createdLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        NSLayoutConstraint.activate([
            createdLabel.topAnchor.constraint(equalTo: originLabel.bottomAnchor, constant: 20),
            createdLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            createdLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10)
        ])
        createdLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configure(with character: Character) {
        nameLabel.text = character.name
        locationLabel.text = "Location: " + character.location.name
        originLabel.text = "Origin: " + character.origin.name
        let dataFormatter = DateFormatter()
        createdLabel.text = "Created: " + dataFormatter.formatISO(date: character.created)
    }
}
