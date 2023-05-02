//
//  FinanceHeaderView.swift
//  CarouselCreditCard
//
//  Created by Emerson Sampaio on 02/05/23.
//

import Foundation
import UIKit

class FinanceHeaderView: UITableViewHeaderFooterView {
    
    static let reuseID = "FinanceHeaderView"
    static let Height: CGFloat = 80
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "History"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var cardNumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "*** 7891"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var cardFlag: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "master-card-logo")
        return image
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        addSubview(title)
        addSubview(cardFlag)
        addSubview(cardNumber)
    }
    
    func layout(){
        NSLayoutConstraint.activate([
            title.centerYAnchor.constraint(equalTo: centerYAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            cardFlag.centerYAnchor.constraint(equalTo: centerYAnchor),
            cardFlag.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            cardFlag.heightAnchor.constraint(equalToConstant: 30),
            cardFlag.widthAnchor.constraint(equalToConstant: 30),
            
            cardNumber.centerYAnchor.constraint(equalTo: centerYAnchor),
            cardNumber.trailingAnchor.constraint(equalTo: cardFlag.leadingAnchor, constant: -10),
        ])
    }
}
