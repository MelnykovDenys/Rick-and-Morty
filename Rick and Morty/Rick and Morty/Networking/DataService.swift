//
//  DataService.swift
//  Rick and Morty
//
//  Created by Mac on 07.12.2020.
//

import Foundation

class DataService {
    
    static let shared = DataService()
    
    func createRequest<T: Decodable>(endpoint: Endpoint, model: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = endpoint.urlWithQuery else { return
            completion(.failure(ApiError.request))
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let validData = data, error == nil else {
                completion(.failure(error!))
                return
            }
            do {
                guard let result = try? JSONDecoder().decode(T.self, from: validData) else {
                    completion(.failure(ApiError.data))
                    return
                }
                completion(.success(result))
            }
        }.resume()
    }
}

enum ApiError: LocalizedError {
    case request
    case data
    
    var errorDescription: String? {
        switch self {
        case .request:
            return "Sorry, the request failed"
        case .data:
            return "Sorry, invalid data"
        }
    }
}

