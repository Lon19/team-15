//
//  TradeCardsTableViewCell.swift
//  redLuck
//
//  Created by Aris Zhu Yi Qing on 2/11/19.
//  Copyright © 2019 Aris Zhu Yi Qing. All rights reserved.
//

import UIKit

class TradeCardsTableViewCell: UITableViewCell {
	
	var profileName, cardsCanOffer, requestForCards: Label!
	var offeringCards, requestingCards: UIView!
	var confirmTrading: Button!
	
	var tableVC: TradeCardsTableViewController!
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		addEveryViewAndSetAutoResizingMaskToFalse()
		setUpViews()
		layoutEveryView()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
}

extension TradeCardsTableViewCell {
	
	fileprivate func addEveryViewAndSetAutoResizingMaskToFalse() {
		profileName = Label()
		cardsCanOffer = Label()
		requestForCards = Label()
		offeringCards = UIView()
		requestingCards = UIView()
		confirmTrading = Button()
		[profileName, cardsCanOffer, requestForCards, offeringCards, requestingCards, confirmTrading].forEach{
			contentView.addSubview($0!)
			$0?.translatesAutoresizingMaskIntoConstraints = false
		}
	}
	
	fileprivate func setUpViews() {
		// set up buttons
		confirmTrading.setImage(UIImage(imageLiteralResourceName: "trade"), for: .normal)
		confirmTrading.setImage(UIImage(imageLiteralResourceName: "success"), for: .selected)
		confirmTrading.addTarget(self, action: #selector(tradedSuccessfully), for: .touchUpInside)
	}
	
	fileprivate func layoutEveryView() {
		let viewsDicWithOptional = ["profileName"		: profileName,
									"cardsCanOffer"		: cardsCanOffer,
									"requestForCards"	: requestForCards,
									"offeringCards"		: offeringCards,
									"requestingCards"	: requestingCards,
									"confirmTrading"	: confirmTrading
		]
		let viewsDic = viewsDicWithOptional as! [String : UIView]
		let metricsDic = ["buttonDimension": 90, "fontSize": FontSize.forTradeCardsInfo]
		
		NSLayoutConstraint.activate([
			NSLayoutConstraint.constraints(withVisualFormat: "|-[profileName]", options: .alignAllCenterY, metrics: metricsDic, views: viewsDic),
			NSLayoutConstraint.constraints(withVisualFormat: "|-[cardsCanOffer]-[offeringCards(fontSize)]", options: .alignAllCenterY, metrics: metricsDic, views: viewsDic),
			NSLayoutConstraint.constraints(withVisualFormat: "|-[requestForCards]-[requestingCards(fontSize)]", options: .alignAllCenterY, metrics: metricsDic, views: viewsDic),
			NSLayoutConstraint.constraints(withVisualFormat: "[confirmTrading(buttonDimension)]-|", options: .alignAllCenterY, metrics: metricsDic, views: viewsDic),
			NSLayoutConstraint.constraints(withVisualFormat: "V:|-[profileName]-[cardsCanOffer]-[requestForCards]-|", options: .alignAllLeading, metrics: metricsDic, views: viewsDic),
			NSLayoutConstraint.constraints(withVisualFormat: "V:|-[confirmTrading(buttonDimension)]", options: .alignAllTrailing, metrics: metricsDic, views: viewsDic),
			NSLayoutConstraint.constraints(withVisualFormat: "V:[offeringCards(fontSize)]", options: .alignAllTrailing, metrics: metricsDic, views: viewsDic),
			NSLayoutConstraint.constraints(withVisualFormat: "V:[requestingCards(fontSize)]", options: .alignAllTrailing, metrics: metricsDic, views: viewsDic)
		].flatMap{$0})
	}
	
	@objc func tradedSuccessfully(_ button: UIButton) {
		if !button.isSelected {
			button.isSelected = !button.isSelected
			tableVC.isTraded[button.tag] = !tableVC.isTraded[button.tag]
		}
	}
}
