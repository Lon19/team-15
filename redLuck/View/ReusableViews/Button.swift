//
//  Button.swift
//  redLuck
//
//  Created by Aris Zhu Yi Qing on 2/11/19.
//  Copyright © 2019 Aris Zhu Yi Qing. All rights reserved.
//

import UIKit

class Button: UIButton {
	
	var information: String?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setTitleColor(fontColor, for: .normal)
		titleLabel?.numberOfLines = 0
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
}
