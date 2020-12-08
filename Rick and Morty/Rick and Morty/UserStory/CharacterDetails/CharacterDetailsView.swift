//
//  CharacterDetailsView.swift
//  Rick and Morty
//
//  Created by Mac on 08.12.2020.
//

import UIKit

class CharacterDetailsView: UIView {

    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(tableView)
        pinToEdges(tableView)
        tableView.register(AvatarTableViewCell.self, forCellReuseIdentifier: AvatarTableViewCell.identifier)
        tableView.register(DescriptionTableViewCell.self, forCellReuseIdentifier: DescriptionTableViewCell.identifier)
        tableView.separatorStyle = .none
    }
}
