//
//  TabBarController.swift
//  redLuck
//
//  Created by Aris Zhu Yi Qing on 1/11/19.
//  Copyright © 2019 Aris Zhu Yi Qing. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		viewControllers = [UIViewController(),
						   TradeCardsViewController(),
						   UIViewController()
		]
		
		for tabBarItem in tabBar.items! {
			tabBarItem.title = "This"
			tabBarItem.imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: -8, right: 0)
		}
		
		// customize tab bar
		tabBar.tintColor = themeColor
		tabBar.barTintColor = .black
		
		// others
		delegate = self
	}
}

extension TabBarController: UITabBarControllerDelegate {
	
	
}
