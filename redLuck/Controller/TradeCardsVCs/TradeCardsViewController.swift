//
//  ViewController.swift
//  redLuck
//
//  Created by Aris Zhu Yi Qing on 1/11/19.
//  Copyright © 2019 Aris Zhu Yi Qing. All rights reserved.
//

import UIKit

class TradeCardsTableViewController: UITableViewController {
	
	let tradeCardsTableViewCellID = "trade cards table view cell ID"
	var isTraded = [false, false, false, false, false, false, false, false, false, false]
	let names = ["Lady Gaga", "John Conner", "Sarah Conner", "Boris Johnson", "David Cameron", "Donald Trump", "Theresa May", "Hilary Clinton", "John Berclow", "Jeremy Corbyn"]
	
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
}

extension TradeCardsTableViewController {
	
	fileprivate func setUpNavBar() {
		navigationItem.title = "Trade!"
	}
	
	fileprivate func addAndSetupTable() {
		tableView = UITableView()
		
		tableView.backgroundColor 		= backgroundColor
		tableView.keyboardDismissMode 	= .onDrag
		tableView.rowHeight 			= 120
		tableView.tableFooterView		= UIView()
		tableView.allowsSelection		= false
		
		tableView.register(TradeCardsTableViewCell.self, forCellReuseIdentifier: tradeCardsTableViewCellID)
	}
}
