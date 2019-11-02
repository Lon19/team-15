//
//  StringExtension.swift
//  redLuck
//
//  Created by Aris Zhu Yi Qing on 2/11/19.
//  Copyright © 2019 Aris Zhu Yi Qing. All rights reserved.
//

import UIKit

extension String {
	
	/// e.g. "I  like    it." will become "I like it."
	func compressMultipleConsecutiveSpacesToOneOnly() -> String {
		
		var compressedString = ""
		/// flag to indicate if the previous char is space
		var isEmptyChar = false
		
		for char in self {
			if char == " " {
				if isEmptyChar == false {
					isEmptyChar = true
					compressedString.append(char)
				}
			} else {
				isEmptyChar = false
				compressedString.append(char)
			}
		}
		
		return compressedString
	}
	
	/// e.g. "I like it." becomes ["I", "like", "it."]
	func convertAStringToAnArrayOfWords() -> [String] {
		/// strip off leading and trailing spaces
		let whitespaceCharacterSet = CharacterSet.whitespaces
		let strippedString = self.trimmingCharacters(in: whitespaceCharacterSet)
		/// eliminate extra spaces in between words
		let whitespaceCompressedString = strippedString.compressMultipleConsecutiveSpacesToOneOnly()
		/// form an array of "words" in the search string
		return whitespaceCompressedString.components(separatedBy: " ")
	}
	
	/// assuming that there are multiple occurrence of a string in the target string,
	/// find out all of them by forming an array of ranges of the target string
	func ranges(of substring: String, options: CompareOptions = [], locale: Locale? = nil) -> [Range<Index>] {
		var ranges: [Range<Index>] = []
		while ranges.last.map({ $0.upperBound < self.endIndex }) ?? true,
			let range = self.range(of: substring, options: options, range: (ranges.last?.upperBound ?? self.startIndex)..<self.endIndex, locale: locale)
		{
			ranges.append(range)
		}
		return ranges
	}
	
	/// similar to contains(_:) function, but case insensitive
	func containsIgnoringCase(_ string: String) -> Bool {
		return self.range(of: string, options: .caseInsensitive) != nil
	}
}
