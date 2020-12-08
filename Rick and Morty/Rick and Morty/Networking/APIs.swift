//
//  APIs.swift
//  Rick and Morty
//
//  Created by Mac on 07.12.2020.
//

import Foundation

enum Endpoint {
    
    case allCharacters(pageNumber: Int)
    case singleCharacter(characterID: Int)
    case locations
    case episodes
    
    private var baseURL: String {
        return "https://rickandmortyapi.com/api/"
    }
    
    private var path: String {
        switch self {
        case .allCharacters:
            return  "character"
        case .singleCharacter(let ID):
            return "character/\(ID)"
        case .locations:
            return "locations"
        case .episodes:
            return "episodes"
        }
    }
    
    var urlWithQuery: URL? {
        var components = URLComponents(string: baseURL + path)
        switch self {
        case .allCharacters(let pageNumber):
            components?.queryItems = [URLQueryItem(name: "page", value: String(pageNumber))]
            return components?.url
        default:
            return components?.url
        }
    }
}
