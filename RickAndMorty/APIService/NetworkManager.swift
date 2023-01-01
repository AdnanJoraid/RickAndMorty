//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by Adnan Joraid on 2022-12-31.
//

import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private let baseUrl = "https://rickandmortyapi.com/api/"
    
    private init() {}
    
    func getCharactersFromAPI(endpoint: String, page: Int, completion: @escaping (Result<RMCharacters, NetworkErrors>) -> Void) {
        let apiEndpoint = baseUrl + endpoint + "?page=\(page)"
        
        guard let url = URL(string: apiEndpoint) else {
            completion(.failure(.invalidResponse))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let characters = try decoder.decode(RMCharacters.self, from: data)
                completion(.success(characters))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
}
