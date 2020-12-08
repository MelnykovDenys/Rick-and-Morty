//
//  CharacterDetailsViewController.swift
//  Rick and Morty
//
//  Created by Mac on 08.12.2020.
//

import UIKit

enum CharacterDetails: Int, CaseIterable {
    case avatar
    case description
}

final class CharacterDetailsViewController: UIViewController {
    
    private let contentView = CharacterDetailsView()
    private var character: Character
    
    init(character: Character) {
        self.character = character
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = character.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.tableView.dataSource = self
    }
}

extension CharacterDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        CharacterDetails.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let emptyCell = UITableViewCell()
        switch CharacterDetails(rawValue: indexPath.row) {
        case .avatar:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AvatarTableViewCell.identifier) as? AvatarTableViewCell else { return emptyCell }
            ImageLoader.shared.obtainAvatarWithURL(urlImage: character.image) { image in
                cell.setupAvatar(with: image)
            }
            return cell
        case .description:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.identifier) as? DescriptionTableViewCell else { return emptyCell }
            cell.configure(with: character)
            return cell
        case .none:
            return emptyCell
        }
    }
}
