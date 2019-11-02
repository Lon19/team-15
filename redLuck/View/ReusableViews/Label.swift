//
//  Labe.swift
//  redLuck
//
//  Created by Aris Zhu Yi Qing on 2/11/19.
//  Copyright © 2019 Aris Zhu Yi Qing. All rights reserved.
//

import UIKit

class Label: UILabel {

	override init(frame: CGRect) {
		super.init(frame: frame)
		
		numberOfLines	= 0
		textColor		= fontColor
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
}
