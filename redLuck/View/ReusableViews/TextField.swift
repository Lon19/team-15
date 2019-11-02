//
//  TextField.swift
//  redLuck
//
//  Created by Aris Zhu Yi Qing on 2/11/19.
//  Copyright © 2019 Aris Zhu Yi Qing. All rights reserved.
//

import UIKit

class TextField: UITextField {
	
	// for MoveKeyboardWhenTyping protocol
	weak var tableViewCell: UITableViewCell?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		borderStyle		= .line
		clearButtonMode	= .whileEditing
		textColor		= fontColor
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
}
