//
//  APIClient.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 18/12/24.
//

import Foundation

protocol APIDataFetchable {
    func fetch<T: Decodable>(request: CryptoAPI, decodeTo type: T.Type, completion: @escaping (Result<T, APIError>) -> Void)
}

class APIClient: APIDataFetchable {
    func fetch<T: Decodable>(request: CryptoAPI, decodeTo type: T.Type, completion: @escaping (Result<T, APIError>) -> Void) {
        let router = Router<CryptoAPI>()
 
        router.request(request) { data, response, error in
            if error != nil {
                completion(.failure(.requestFailed(error ?? APIError.invalidData)))
            }
            
            guard let data = data else { return }
            do {
                let response = try JSONDecoder().decode(type, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(.requestFailed(error)))
            }
        }
    }
}

