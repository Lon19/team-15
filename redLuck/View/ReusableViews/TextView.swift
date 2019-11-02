//
//  TextView.swift
//  redLuck
//
//  Created by Aris Zhu Yi Qing on 2/11/19.
//  Copyright © 2019 Aris Zhu Yi Qing. All rights reserved.
//

import UIKit

class TextView: UITextView {
	
	// for MoveKeyboardWhenTyping protocol
	weak var tableViewCell: UITableViewCell?
	
	override init(frame: CGRect, textContainer: NSTextContainer?) {
		super.init(frame: frame, textContainer: textContainer)
		
		layer.borderColor	= UIColor.black.cgColor
		layer.borderWidth	= CGFloat(1)
		textColor			= fontColor
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
}
