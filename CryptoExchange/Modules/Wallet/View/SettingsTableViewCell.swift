//
//  SettingsTableViewCell.swift
//  CryptoExchange
//
//  Created by Bishal Ram on 31/03/24.
//

import UIKit
import Stevia

class SettingsTableViewCell: UITableViewCell {
    
    var model: Settings? {
        didSet {
            populateCell()
        }
    }
    
    private let settingsIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "user")
        return imageView
    }()
    
    private let coinNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let chevronIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "right-icon")
        return imageView
    }()
    
    private let underLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViewLayout() {
        self.subviews {
            settingsIcon
            coinNameLabel
            chevronIcon
            underLine
        }
        
        settingsIcon.Left == Left + 12
        settingsIcon.Top == Top + 12
        settingsIcon.size(20)
        settingsIcon.Bottom == underLine.Top - 12
        
        coinNameLabel.CenterY == settingsIcon.CenterY
        coinNameLabel.Left == settingsIcon.Right + 6
        
        chevronIcon.Right == Right - 12
        chevronIcon.CenterY == settingsIcon.CenterY
        chevronIcon.size(20)
        
        underLine.fillHorizontally(padding: 4)
        underLine.height(0.5)
        underLine.Bottom == Bottom
    }
    
    private func populateCell() {
        guard let model = model else { return }
        settingsIcon.image = UIImage(named: model.icon)
        coinNameLabel.text = model.title
    }
}
