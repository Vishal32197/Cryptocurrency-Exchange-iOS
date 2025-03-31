//
//  CoinDetailViewController.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 30/03/24.
//

import UIKit
import Stevia
import RxSwift

class CoinDetailViewController: UIViewController {
    
    private lazy var chatView: GraphView = {
        let view = GraphView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupViewLayout()
    }
    
    private func setupViewLayout() {
        view.subviews {
            chatView
        }
        
        chatView.fillHorizontally()
        chatView.Top == view.safeAreaLayoutGuide.Top + 20
        chatView.height(200)
    }
    
    private func bindView() {
        
    }
}
