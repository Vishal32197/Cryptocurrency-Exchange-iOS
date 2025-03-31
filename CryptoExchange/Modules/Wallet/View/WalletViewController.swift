//
//  WalletViewController.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 24/03/24.
//

import UIKit
import Stevia
import RxSwift

class WalletViewController: UIViewController {
    
    private let viewModel: WalletViewModelProtocol
    private let dispoBag = DisposeBag()
    
    private let walletView: WalletView = {
        let view = WalletView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .yellow
        return view
    }()
    
    private lazy var settingsTableView: UITableView = {
        let tableview = UITableView()
        tableview.register(SettingsTableViewCell.self, forCellReuseIdentifier: "\(SettingsTableViewCell.self)")
        tableview.estimatedRowHeight = 42.0
        tableview.separatorStyle = .none
        tableview.rowHeight = UITableView.automaticDimension
        return tableview
    }()
    
    init(viewModel: WalletViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
         view.backgroundColor = .white
         setupViewLayout()
         bindView()
        viewModel.getSettings()
      }
    
    private func setupViewLayout() {
        view.subviews {
            walletView
            settingsTableView
        }
        
        walletView.Top == view.safeAreaLayoutGuide.Top + 20
        walletView.fillHorizontally(padding: 24)
        walletView.height(200)
        
        settingsTableView.Top == walletView.Bottom + 60
        settingsTableView.fillHorizontally()
        settingsTableView.Bottom == view.Bottom
    }
    
    private func bindView() {
        viewModel.settingsData
            .bind(to: settingsTableView.rx.items(cellIdentifier: "\(SettingsTableViewCell.self)", cellType: SettingsTableViewCell.self)) {[weak self] row, element, cell in
                cell.model = element
            }.disposed(by: dispoBag)
    }
}
