//
//  GraphViewViewModelFactory.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 20/03/24.
//

import Foundation
import RxRelay

protocol GraphViewModelProtocol {
    var chatDataSource: PublishRelay<[PriceData]> { get }
}

class GraphViewModelFactory: GraphViewModelProtocol {
    var chatDataSource = RxRelay.PublishRelay<[PriceData]>()
}
