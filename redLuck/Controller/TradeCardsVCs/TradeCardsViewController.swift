//
//  ViewController.swift
//  redLuck
//
//  Created by Aris Zhu Yi Qing on 1/11/19.
//  Copyright © 2019 Aris Zhu Yi Qing. All rights reserved.
//

import UIKit

class TradeCardsViewController: UIViewController {
	
	let tradeCardsTableViewCellID = "trade cards table view cell ID"
	var isTraded = [false, false, false, false, false, false, false, false, false, false]
	let names = ["Lady Gaga", "John Conner", "Sarah Conner", "Boris Johnson", "David Cameron", "Donald Trump", "Theresa May", "Hilary Clinton", "John Berclow", "Jeremy Corbyn"]
	
	var tradeCardsTableView: UITableView!
	
	override func loadView() {
		view = UIView()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		view.backgroundColor = backgroundColor
		
		setUpNavBar()
		addAndSetupTable()
	}

	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		
		tradeCardsTableView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			tradeCardsTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: marginLength),
			tradeCardsTableView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
			tradeCardsTableView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
			tradeCardsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
			])
	}
}

extension TradeCardsViewController {
	
	fileprivate func setUpNavBar() {
		navigationItem.title = "Trade!"
	}
	
	fileprivate func addAndSetupTable() {
		tradeCardsTableView = UITableView()
		view.addSubview(tradeCardsTableView)
		
		tradeCardsTableView.backgroundColor 		= backgroundColor
		tradeCardsTableView.keyboardDismissMode 	= .onDrag
		tradeCardsTableView.rowHeight 				= 120
		tradeCardsTableView.tableFooterView			= UIView()
		
		tradeCardsTableView.dataSource = self
		tradeCardsTableView.delegate = self
		tradeCardsTableView.register(TradeCardsTableViewCell.self, forCellReuseIdentifier: tradeCardsTableViewCellID)
	}
}
