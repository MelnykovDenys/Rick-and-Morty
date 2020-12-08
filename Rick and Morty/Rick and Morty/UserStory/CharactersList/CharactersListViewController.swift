//
//  ViewController.swift
//  Rick and Morty
//
//  Created by Mac on 07.12.2020.
//

import UIKit

final class CharactersListViewController: UIViewController {
    
    private let viewModel = CharactersListViewModel()
    private let contentView = CharactersListView()
    private var pageNumber = Constants.defaultPage
    
    override func loadView() {
        self.view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        viewModel.delegate = self
        viewModel.searchList()
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Characters".localized
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "A-Z", style: .plain, target: self, action: #selector(sortTapped))
    }
    
    @objc private func sortTapped() {
        viewModel.characters.sort { $0.name < $1.name }
        contentView.tableView.reloadData()
    }
}

extension CharactersListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard indexPath.row == viewModel.characters.count - 1 else { return }
        guard pageNumber < viewModel.countPages else { return }
        contentView.addFooterIndicator()
        pageNumber += 1
        viewModel.searchList(page: pageNumber)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = CharacterDetailsViewController(character: viewModel.characters[indexPath.row])
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension CharactersListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.characterListIdentifier, for: indexPath) as? CharactersListTableViewCell else {
            return UITableViewCell()
        }
        let character = viewModel.characters[indexPath.row]
        ImageLoader.shared.obtainAvatarWithURL(urlImage: character.image) { image in
            if tableView.cellForRow(at: indexPath) != nil {
                cell.updateAvatar(with: image)
            }
        }
        cell.configure(with: character)
        return cell
    }
}

extension CharactersListViewController: CharactersListViewModelDelegate {
    func didFindCharacters() {
        contentView.removeFooterIndicator()
        contentView.tableView.reloadData()
    }
    
    func requestDidFail(with error: Error) {
        contentView.removeFooterIndicator()
        let alert = UIAlertController.errorAlert(with: error.localizedDescription)
        present(alert, animated: true)
    }
}
