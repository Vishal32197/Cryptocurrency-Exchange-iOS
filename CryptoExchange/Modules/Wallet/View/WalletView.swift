//
//  WalletView.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 31/03/24.
//

import UIKit
import Stevia

class WalletView: UIView {
 
    private var curveView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20.0
        view.backgroundColor = .yellow
        return view
    }()
    
    private var portfolioTitle: UILabel = {
        let label = UILabel()
        label.text = "Wallet Balance"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private var holdingAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "USD 3000"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setupViewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewLayout() {
        self.subviews {
            curveView
        }
        
        curveView.fillContainer()
        
        curveView.subviews {
            portfolioTitle
            holdingAmountLabel
        }
        
        portfolioTitle.Top == curveView.Top + 24
        portfolioTitle.CenterX == curveView.CenterX
        
        holdingAmountLabel.Top == portfolioTitle.Bottom + 12
        holdingAmountLabel.CenterX == curveView.CenterX
        
    }
}
