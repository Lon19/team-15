//
//  TradeCardsNavigationController.swift
//  redLuck
//
//  Created by Aris Zhu Yi Qing on 2/11/19.
//  Copyright © 2019 Aris Zhu Yi Qing. All rights reserved.
//

import UIKit

class TradeCardsNavigationController: UINavigationController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		viewControllers = [TradeCardsViewController()]
		
		// customize nav bar
		navigationBar.barTintColor = themeColor
		navigationBar.tintColor = barTintColor
	}
}
