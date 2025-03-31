//
//  Routing.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 20/03/24.
//

import Foundation
import UIKit

enum AppRoute {
    case home
    case profile
    case settings
}

// Define a custom routing handler
struct NavigationRouter {
    static let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController
    
    static func navigateToCoinDetailScreen() {
        let vm = CoinDetailViewController()
        navigationController?.pushViewController(vm, animated: true)
    }
}

// Example usage
class SomeViewController: UIViewController {
    func navigateToProfile(userID: String) {
       
    }
}
