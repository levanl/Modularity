//
//  NetworkManager.swift
//  modular
//
//  Created by Levan Loladze on 19.11.23.
//

import Foundation
import UIKit


final class NetworkManager {
    
    static func getFacts(completion: @escaping (Result<FactModel, Error>) -> Void) {
        let endpoint = "https://catfact.ninja/facts"
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let fact = try decoder.decode(FactModel.self, from: data!)
                completion(.success(fact))
            } catch {
                if let decodingError = error as? DecodingError {
                    print("Decoding Error: \(decodingError)")
                }
                completion(.failure(NetworkError.invalidData))
            }
        }.resume()
    }
}


enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

