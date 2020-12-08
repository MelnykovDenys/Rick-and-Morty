//
//  CharactersListViewModel.swift
//  Rick and Morty
//
//  Created by Mac on 07.12.2020.
//

import Foundation

protocol CharactersListViewModelDelegate: class {
    func didFindCharacters()
    func requestDidFail(with error: Error)
}

class CharactersListViewModel {
    
    var characters = [Character]()
    
    private let dataService = DataService()
    private(set) var countPages = Int()
    
    weak var delegate: CharactersListViewModelDelegate?
    
    func searchList(page: Int = 1) {
        dataService.createRequest(endpoint: .allCharacters(pageNumber: page), model: CharactersList.self) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let characterList):
                    self.characters.append(contentsOf: characterList.characters)
                    self.countPages = characterList.info.pages
                    self.delegate?.didFindCharacters()
                case .failure(let error):
                    self.delegate?.requestDidFail(with: error)
                }
            }
        }
    }
}
