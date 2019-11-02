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
		
		viewControllers = [DummyViewController(),
						   TradeCardsNavigationController(),
						   DummyViewController(),
						   DummyViewController()
		]
		
		let gameGrey = UIImage(imageLiteralResourceName: "gameGrey").resizeImage(targetSize: CGSize(width: 50, height: 50))
		let game = UIImage(imageLiteralResourceName: "game").resizeImage(targetSize: CGSize(width: 50, height: 50))
		let tabBarItemForGame = UITabBarItem(title: nil, image: gameGrey, selectedImage: game.withRenderingMode(.alwaysOriginal))
		
		let cardGrey = UIImage(imageLiteralResourceName: "cardGrey").resizeImage(targetSize: CGSize(width: 50, height: 50))
		let card = UIImage(imageLiteralResourceName: "card").resizeImage(targetSize: CGSize(width: 50, height: 50))
		let tabBarItemForCard = UITabBarItem(title: nil, image: cardGrey, selectedImage: card.withRenderingMode(.alwaysOriginal))
		
		let chatGrey = UIImage(imageLiteralResourceName: "chatGrey").resizeImage(targetSize: CGSize(width: 50, height: 50))
		let chat = UIImage(imageLiteralResourceName: "chat").resizeImage(targetSize: CGSize(width: 50, height: 50))
		let tabBarItemForChat = UITabBarItem(title: nil, image: chatGrey, selectedImage: chat.withRenderingMode(.alwaysOriginal))
		
		let profileGrey = UIImage(imageLiteralResourceName: "profileGrey").resizeImage(targetSize: CGSize(width: 50, height: 50))
		let profile = UIImage(imageLiteralResourceName: "profile").resizeImage(targetSize: CGSize(width: 50, height: 50))
		let tabBarItemForProfile = UITabBarItem(title: nil, image: profileGrey, selectedImage: profile.withRenderingMode(.alwaysOriginal))
		
		viewControllers![0].tabBarItem = tabBarItemForGame
		viewControllers![0].tabBarItem.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)
		viewControllers![1].tabBarItem = tabBarItemForCard
		viewControllers![1].tabBarItem.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)
		viewControllers![2].tabBarItem = tabBarItemForChat
		viewControllers![2].tabBarItem.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)
		viewControllers![3].tabBarItem = tabBarItemForProfile
		viewControllers![3].tabBarItem.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)
		
		// customize tab bar
		tabBar.tintColor = themeColor
		tabBar.barTintColor = .white
	}
}

