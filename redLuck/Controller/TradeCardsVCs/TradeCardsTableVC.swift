//
//  TradeCardsTableVC.swift
//  redLuck
//
//  Created by Aris Zhu Yi Qing on 1/11/19.
//  Copyright © 2019 Aris Zhu Yi Qing. All rights reserved.
//

import UIKit

extension TradeCardsTableViewController {
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return isTraded.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: tradeCardsTableViewCellID, for: indexPath) as! TradeCardsTableViewCell
		
		cell.tableVC = self
		cell.confirmTrading.tag = indexPath.row
		
		cell.profileName.text = names[indexPath.row]
		cell.cardsCanOffer.text = "Offering: "
		cell.requestForCards.text = "Requesting: "
		
		let card1 = UIImage(imageLiteralResourceName: "card1").resizeImage(targetSize: CGSize(width: FontSize.forTradeCardsInfo, height: FontSize.forTradeCardsInfo))
		let card2 = UIImage(imageLiteralResourceName: "card2").resizeImage(targetSize: CGSize(width: FontSize.forTradeCardsInfo, height: FontSize.forTradeCardsInfo))
		cell.offeringCards.backgroundColor = UIColor(patternImage: card1)
		cell.requestingCards.backgroundColor = UIColor(patternImage: card2)
		
		cell.confirmTrading.isSelected = isTraded[indexPath.row]
		
		return cell
	}
}


