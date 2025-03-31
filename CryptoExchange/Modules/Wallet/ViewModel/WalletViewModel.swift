//
//  WalletViewModel.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 24/03/24.
//

import Foundation
import RxRelay

protocol WalletViewModelProtocol {
    var settingsData: PublishRelay<[Settings]> { get }
    func getSettings()
}

class WalletViewModel: WalletViewModelProtocol {
 
    var settingsData = RxRelay.PublishRelay<[Settings]>()
    
    func getSettings() {
        let settingsValue: [Settings] = [.account, .faq, .security, .support]
        settingsData.accept(settingsValue)
    }
    
}

enum Settings: Equatable {
    case account, security, faq, support
}

extension Settings {
    var icon: String {
        switch self {
        case .account:
            return "user"
        case .security:
            return "user"
        case .faq:
            return "user"
        case .support:
            return "user"
        }
    }
    
    var title: String {
        switch self {
        case .account:
            return"User Account"
        case .security:
            return "Security"
        case .faq:
            return "FAQ"
        case .support:
            return "Support"
        }
    }
}
