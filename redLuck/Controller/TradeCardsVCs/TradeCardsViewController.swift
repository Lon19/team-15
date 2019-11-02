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
	
	var tradeCardSearchController: UISearchController!
	
	override func loadView() {
		view = UIView()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		view.backgroundColor = backgroundColor
		
		setUpNavBar()
		setUpHomeSearchBar()
		addAndSetupTable()
	}
}

extension TradeCardsTableViewController {
	
	fileprivate func setUpNavBar() {
		navigationItem.title = "Trade!"
		
		let tradeCardSearchResultController = TradeCardsSearchController()
		tradeCardSearchResultController.tradeCardsVC = self
		
		tradeCardSearchController = UISearchController(searchResultsController: tradeCardSearchResultController)
		tradeCardSearchController.searchResultsUpdater = self
		tradeCardSearchController.obscuresBackgroundDuringPresentation = false
		definesPresentationContext = true
		navigationItem.searchController = tradeCardSearchController
	}
	
	fileprivate func setUpHomeSearchBar() {
		navigationItem.hidesSearchBarWhenScrolling = false
		
		let homeSearchBar = navigationItem.searchController!.searchBar
		homeSearchBar.placeholder = "Search here"
		homeSearchBar.tintColor = themeColor
		
		// set the search bar field background color to white
		// but it appears that making it gray is the best can be done?
		let homeSearchBarBackgroundView = (homeSearchBar.value(forKey: "searchField") as? UITextField)!.subviews[0]
		homeSearchBarBackgroundView.backgroundColor			= backgroundColor
		homeSearchBarBackgroundView.layer.cornerRadius		= 10;
		homeSearchBarBackgroundView.clipsToBounds			= true;
		
		homeSearchBar.delegate = self
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

extension TradeCardsTableViewController: UISearchBarDelegate {
	
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		searchBar.resignFirstResponder()
	}
	
	func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
		if !searchBar.showsCancelButton {
			searchBar.setShowsCancelButton(true, animated: true)
		}
	}
	
	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
		searchBar.text = ""
		searchBar.setShowsCancelButton(false, animated: true)
		searchBar.resignFirstResponder()
	}
}
