//
//  DummyVC.swift
//  redLuck
//
//  Created by Aris Zhu Yi Qing on 2/11/19.
//  Copyright © 2019 Aris Zhu Yi Qing. All rights reserved.
//

import UIKit

class DummyViewController: UIViewController {
	
	override func loadView() {
		view = UIView()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = backgroundColor
	}
}
