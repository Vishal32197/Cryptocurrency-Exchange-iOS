//
//  PortfolioView.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 24/03/24.
//

import UIKit
import Stevia

class PortfolioView: UIView {

    private var curveView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20.0
        view.backgroundColor = .yellow
        return view
    }()
    
    private var portfolioTitle: UILabel = {
        let label = UILabel()
        label.text = "Portfolio"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private var holdingAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "USD 3000"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    private var profitLossTitle: UILabel = {
        let label = UILabel()
        label.text = "Profit/Loss"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private var profitLossValueLabel: UILabel = {
        let label = UILabel()
        label.text = "-900"
        label.textColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 14)
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
            profitLossTitle
            profitLossValueLabel
        }
        
        portfolioTitle.Top == curveView.Top + 24
        portfolioTitle.CenterX == curveView.CenterX
        
        holdingAmountLabel.Top == portfolioTitle.Bottom + 12
        holdingAmountLabel.CenterX == curveView.CenterX
        
        profitLossTitle.Top == holdingAmountLabel.Bottom + 20
        profitLossTitle.CenterX == curveView.CenterX
        
        profitLossValueLabel.Top == profitLossTitle.Bottom + 4
        profitLossValueLabel.CenterX == profitLossTitle.CenterX
        profitLossValueLabel.bottom(24)
    }
}
