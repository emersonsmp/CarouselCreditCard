//  CarouselCardsView.swift
//  CarouselCreditCard
//  Created by Emerson Sampaio on 02/05/23.

import Foundation
import UIKit
import FSPagerView

class CarouselCardsView: UIView{
    
    var pages:[PagerDM] = [
        PagerDM(img: "card2"),
        PagerDM(img: "card3"),
        PagerDM(img: "card4"),
        PagerDM(img: "card5"),
        PagerDM(img: "card6")]
    
    var financeEntries:[FinanceOperation] = [
        FinanceOperation(img: "fastfood", placeName: "Pizza Hut", placeDetail: "Pizza Hut Morumbi", value: "R$234,00", data: "22 Mai 23"),
        FinanceOperation(img: "market", placeName: "Morumbi Market", placeDetail: "Morumbi Market Paulista", value: "R$182,56", data: "19 Mai 23"),
        FinanceOperation(img: "fastfood", placeName: "MC Donalds", placeDetail: "Arco Brasil", value: "R$23,90", data: "15 Mai 23"),
        FinanceOperation(img: "shopping-mall", placeName: "Shooping", placeDetail: "Brasil Shooping", value: "R$89,97", data: "10 Mai 23"),
        FinanceOperation(img: "fastfood", placeName: "Pizza Hut", placeDetail: "Pizza Hut Morumbi", value: "R$234,00", data: "22 Mai 23"),
        FinanceOperation(img: "market", placeName: "Morumbi Market", placeDetail: "Morumbi Market Paulista", value: "R$182,56", data: "19 Mai 23"),
        FinanceOperation(img: "fastfood", placeName: "MC Donalds", placeDetail: "Arco Brasil", value: "R$23,90", data: "15 Mai 23"),
        FinanceOperation(img: "shopping-mall", placeName: "Shooping", placeDetail: "Brasil Shooping", value: "R$89,97", data: "10 Mai 23")
    ]
    
    lazy var view: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var title: UILabel = {
        let title = UILabel()
        title.text = "Meus Cartões"
        title.textColor = .black
        title.font = UIFont.boldSystemFont(ofSize: 22)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var pagerView: FSPagerView = {
        let pager = FSPagerView()
        pager.translatesAutoresizingMaskIntoConstraints = false
        pager.backgroundColor = .white
        pager.delegate = self
        pager.dataSource = self
        pager.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
//        pager.itemSize = CGSize(width: UIScreen.main.bounds.width-40, height: UIScreen.main.bounds.height/4.5)
        pager.itemSize = CGSize(width: 320, height: 200)
        pager.interitemSpacing = 10
        pager.transformer = FSPagerViewTransformer(type: .coverFlow)
        return pager
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FinanceHeaderView.self, forHeaderFooterViewReuseIdentifier: FinanceHeaderView.reuseID)
        tableView.register(FinanceCell.self, forCellReuseIdentifier: FinanceCell.reuseID)
        tableView.rowHeight = FinanceCell.rowHeight
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}

extension CarouselCardsView {
    func style() {
        backgroundColor = .white
        addSubview(view)
        addSubview(title)
        addSubview(pagerView)
        addSubview(tableView)
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.heightAnchor.constraint(equalToConstant: 50),
            
            title.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            pagerView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 2),
            pagerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            pagerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            pagerView.heightAnchor.constraint(equalToConstant: 250),
            
            tableView.topAnchor.constraint(equalTo: pagerView.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension CarouselCardsView: FSPagerViewDataSource {
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = pages[index].image
        return cell
    }

    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return pages.count
    }
}

extension CarouselCardsView: FSPagerViewDelegate {
    func pagerView(_ pagerView: FSPagerView, didHighlightItemAt index: Int) {
        
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        
    }
}

extension CarouselCardsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return financeEntries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FinanceCell.reuseID, for: indexPath) as! FinanceCell
        
        cell.iconImage.image = financeEntries[indexPath.row].image
        cell.nameLabel.text = financeEntries[indexPath.row].placeName
        cell.descriptionlabel.text = financeEntries[indexPath.row].placeDetail
        cell.value.text = financeEntries[indexPath.row].value
        cell.opData.text = financeEntries[indexPath.row].data
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: FinanceHeaderView.reuseID) as? FinanceHeaderView else {
            fatalError("Unable to dequeue MyHeader")
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return FinanceHeaderView.Height
    }
}
