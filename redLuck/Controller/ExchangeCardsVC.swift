//
//  ExchangeCardsVC.swift
//  redLuck
//
//  Created by Aris Zhu Yi Qing on 2/11/19.
//  Copyright © 2019 Aris Zhu Yi Qing. All rights reserved.
//

import UIKit

class ExchangeCardsViewController: UIViewController {
	
	var exchange, activity, gift: Button!
	
	override func loadView() {
		view = UIView()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = backgroundColor
		addEveryView()
		setUpViews()
		setUpNavBar()
	}
	
	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		[exchange, activity, gift].forEach{ $0?.translatesAutoresizingMaskIntoConstraints = false }
		
		let viewsDicWithOptional = ["exchange": exchange, "activity": activity, "gift": gift]
		let viewsDic = viewsDicWithOptional as! [String : UIView]
		let metricsDic = ["gap" : 90]
		
		NSLayoutConstraint.activate([
			NSLayoutConstraint.constraints(withVisualFormat: "|-(gap)-[exchange]-(gap)-|", options: .alignAllBottom, metrics: metricsDic, views: viewsDic),
			NSLayoutConstraint.constraints(withVisualFormat: "|-(gap)-[activity]-(gap)-|", options: .alignAllBottom, metrics: metricsDic, views: viewsDic),
			NSLayoutConstraint.constraints(withVisualFormat: "|-(gap)-[gift]-(gap)-|", options: .alignAllBottom, metrics: metricsDic, views: viewsDic),
			NSLayoutConstraint.constraints(withVisualFormat: "V:|-(gap)-[exchange]-(gap)-[activity]-(gap)-[gift]-(gap)-|", options: .alignAllCenterX, metrics: metricsDic, views: viewsDic)
			].flatMap{$0})
		
	}
}

extension ExchangeCardsViewController {
	
	fileprivate func addEveryView() {
		exchange = Button()
		activity = Button()
		gift = Button()
		[exchange, activity, gift].forEach{ view.addSubview($0) }
	}
	
	fileprivate func setUpViews() {
		exchange.setImage(UIImage(imageLiteralResourceName: "exchange"), for: .normal)
		activity.setImage(UIImage(imageLiteralResourceName: "activity"), for: .normal)
		gift.setImage(UIImage(imageLiteralResourceName: "gift"), for: .normal)
		
		exchange.addTarget(self, action: #selector(startExchanging), for: .touchUpInside)
		activity.addTarget(self, action: #selector(startActivity), for: .touchUpInside)
		gift.addTarget(self, action: #selector(startGivingGift), for: .touchUpInside)
	}
	
	fileprivate func setUpNavBar() {
		navigationItem.title = "Cards"
	}
}


extension ExchangeCardsViewController {
	
	@objc func startExchanging(_ button: UIButton) {
		navigationController?.pushViewController(TradeCardsViewController(), animated: true)
	}
	
	@objc func startActivity(_ button: UIButton) {
		
	}
	
	@objc func startGivingGift(_ button: UIButton) {
		
	}
}
