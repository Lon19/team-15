//
//  TradeCardSearchController.swift
//  redLuck
//
//  Created by Aris Zhu Yi Qing on 2/11/19.
//  Copyright © 2019 Aris Zhu Yi Qing. All rights reserved.
//

import UIKit

class TradeCardsSearchController: UITableViewController {
	
	weak var tradeCardsVC: TradeCardsTableViewController!
	
	var filteredNames = [String]()
	let tradeCardsTableViewCellID = "tradeCards!"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.backgroundColor 		= backgroundColor
		tableView.keyboardDismissMode 	= .onDrag
		tableView.rowHeight 			= 120
		tableView.tableFooterView		= UIView()
		tableView.allowsSelection		= false
		
		tableView.register(TradeCardsTableViewCell.self, forCellReuseIdentifier: tradeCardsTableViewCellID)
	}
}


// MARK: - data source

extension TradeCardsSearchController {
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return filteredNames.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: tradeCardsTableViewCellID, for: indexPath) as! TradeCardsTableViewCell
		
		cell.tableVC = tradeCardsVC
		cell.confirmTrading.tag = indexPath.row
		
		cell.profileName.text = filteredNames[indexPath.row]
		cell.profileName.attributedText = NSAttributedString(string: filteredNames[indexPath.row], attributes:
		[.underlineStyle: NSUnderlineStyle.single.rawValue])
		cell.cardsCanOffer.text = "Offering: "
		cell.requestForCards.text = "Requesting: "
		
		let card1 = UIImage(imageLiteralResourceName: "card1").resizeImage(targetSize: CGSize(width: FontSize.forTradeCardsInfo, height: FontSize.forTradeCardsInfo))
		let card2 = UIImage(imageLiteralResourceName: "card2").resizeImage(targetSize: CGSize(width: FontSize.forTradeCardsInfo, height: FontSize.forTradeCardsInfo))
		cell.offeringCards.backgroundColor = UIColor(patternImage: card1)
		cell.requestingCards.backgroundColor = UIColor(patternImage: card2)
		
		cell.confirmTrading.isSelected = false
		
		// highlight the search result
		let searchItems = tradeCardsVC.navigationItem.searchController!.searchBar.text!.convertAStringToAnArrayOfWords()
		let attributedProfileName = NSMutableAttributedString(string: cell.profileName.text!, attributes:
			[.font: UIFont.systemFont(ofSize: FontSize.forTradeCardsInfo, weight: .bold)])
		
		for searchItem in searchItems {
			
			if let profileName = cell.profileName.text, profileName.containsIgnoringCase(searchItem) {
				// obtain the ranges of the searched text
				let rangesOfTextToHighlight = profileName.ranges(of: searchItem, options: [.caseInsensitive, .diacriticInsensitive])
				// add attribute (background color) to the ranges
				/// addAttribute works with NSRange instead of Range, thus conversion is necessary
				for rangeOfTextToHighlight in rangesOfTextToHighlight {
					let nsRangeOfTextToHighlight = NSRange(rangeOfTextToHighlight, in: profileName)
					attributedProfileName.addAttribute(.backgroundColor, value: UIColor.yellow, range: nsRangeOfTextToHighlight)
				}
			}
		}
		cell.profileName.attributedText = attributedProfileName
		
		return cell
	}
}
