//
//  FinanceCell.swift
//  CarouselCreditCard
//
//  Created by Emerson Sampaio on 02/05/23.
//

import Foundation
import UIKit

enum AccountType: String {
    case Banking
    case CreditCard
    case Investment
}

class FinanceCell: UITableViewCell {
    
    struct ViewModel {
        let accoountType: AccountType
        let accountName: String
        let balance: Decimal
        let image: UIImageView
    }
    
    static let reuseID = "AccountSummaryCell"
    static let rowHeight: CGFloat = 80
    
    lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .init(red: 1, green: 0, blue: 0, alpha: 0.5)
        view.layer.cornerRadius = 25
        return view
    }()
    
    lazy var iconImage: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "fastfood")
        icon.image = image
        return icon
    }()
    
    lazy var nameLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Grocery"
        name.font = UIFont.boldSystemFont(ofSize: 16)
        return name
    }()
    
    lazy var descriptionlabel: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.font = UIFont.preferredFont(forTextStyle: .caption1)
        description.textColor = .gray
        description.text = "Real Grocery mall"
        return description
    }()
    
    lazy var value: UILabel = {
        let value = UILabel()
        value.translatesAutoresizingMaskIntoConstraints = false
        value.text = "R$122,90"
        value.font = UIFont.boldSystemFont(ofSize: 16)
        return value
    }()
    
    lazy var opData: UILabel = {
        let date = UILabel()
        date.translatesAutoresizingMaskIntoConstraints = false
        date.font = UIFont.preferredFont(forTextStyle: .caption1)
        date.textColor = .gray
        date.text = "22 Maio 23"
        return date
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FinanceCell {
    func setup(){
        addSubview(view)
        addSubview(iconImage)
        addSubview(nameLabel)
        addSubview(descriptionlabel)
        addSubview(value)
        addSubview(opData)
    }
    
    func layout(){
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            view.heightAnchor.constraint(equalToConstant: 50),
            view.widthAnchor.constraint(equalToConstant: 50),
            
            iconImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            iconImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconImage.heightAnchor.constraint(equalToConstant: 25),
            iconImage.widthAnchor.constraint(equalToConstant: 25),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
            
            descriptionlabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            descriptionlabel.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
            
            value.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            value.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            opData.topAnchor.constraint(equalTo: value.bottomAnchor, constant: 10),
            opData.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
}
