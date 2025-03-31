//
//  NetworkService.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 24/12/23.
//

import Foundation

protocol NetworkServiceProtocol {
    func getAssets(completion: @escaping (_ response: Assets?, _ error: Error?) -> ())
}

class NetworkService: NetworkServiceProtocol {
    
    private let apiClient: APIDataFetchable
    
    init(apiClient: APIDataFetchable = APIClient()) {
        self.apiClient = apiClient
    }
    
    func getAssets(completion: @escaping (Assets?, (any Error)?) -> ()) {
        apiClient.fetch(request: .getAssets, decodeTo: Assets.self) { result in
            switch result {
            case .success(let post):
                completion(post, nil)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
