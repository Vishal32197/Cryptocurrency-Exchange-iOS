//
//  APIError.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 18/12/24.
//

import Foundation

enum APIError: Error {
    case requestFailed(Error)
    case invalidData
    case decodingError(Error)
}
