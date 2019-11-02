//
//  ViewController.swift
//  redLuck
//
//  Created by Aris Zhu Yi Qing on 1/11/19.
//  Copyright © 2019 Aris Zhu Yi Qing. All rights reserved.
//

import UIKit

class TradeCardsViewController: UIViewController {
	
	var tradeCardsTableView: UITableView!
	
	override func loadView() {
		view = UIView()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		view.backgroundColor = themeColor
		
		addAndSetupTable()
	}


}

extension TradeCardsViewController {
	
	fileprivate func addAndSetupTable() {
		tradeCardsTableView = UITableView()
	}
}
