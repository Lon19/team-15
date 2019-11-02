//
//  TradeCardsSearchResultsUpdater.swift
//  redLuck
//
//  Created by Aris Zhu Yi Qing on 2/11/19.
//  Copyright © 2019 Aris Zhu Yi Qing. All rights reserved.
//

import UIKit

extension TradeCardsTableViewController: UISearchResultsUpdating {
	
	func updateSearchResults(for searchController: UISearchController) {
		
		let searchResults = ["Lady Gaga", "John Conner", "Sarah Conner", "Boris Johnson", "David Cameron", "Donald Trump", "Theresa May", "Hilary Clinton", "John Berclow", "Jeremy Corbyn"]
		
		let searchItems = navigationItem.searchController?.searchBar.text ?? ""
		
		let filteredResults = searchResults.filter{ $0.containsIgnoringCase(searchItems) }
		
		if let resultsController = navigationItem.searchController?.searchResultsController as? TradeCardsSearchController {
			
			resultsController.filteredNames = filteredResults
			resultsController.tableView.reloadData()
		}
		
	}
	
}
