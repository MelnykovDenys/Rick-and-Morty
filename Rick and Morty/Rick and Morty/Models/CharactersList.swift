//
//  CharactersList.swift
//  Rick and Morty
//
//  Created by Mac on 07.12.2020.
//

import Foundation

struct CharactersList: Decodable {
    let info: Info
    let characters: [Character]
    
    private enum CodingKeys: String, CodingKey {
        
        case info
        case characters = "results"
    }
}

struct Info: Decodable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct Character: Decodable {
    
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct Origin: Decodable {
    let name: String
    let url: String
}

struct Location: Decodable {
    let name: String
    let url: String
}
