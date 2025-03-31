//
//  PortfolioViewController.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 24/03/24.
//

import UIKit
import RxSwift
import RxCocoa
import Stevia

class PortfolioViewController: UIViewController {
    
    private let portfolioView: PortfolioView = {
        let view = PortfolioView()
        view.backgroundColor = .yellow
        view.layer.cornerRadius = 20
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewLayout()
    }

    
    private func setupViewLayout() {
        self.view.backgroundColor = .white
        view.subviews {
            portfolioView
        }
        
        portfolioView.Top == view.safeAreaLayoutGuide.Top + 20
        portfolioView.fillHorizontally(padding: 32).height(200)
    }
}
