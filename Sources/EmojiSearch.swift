import Foundation
import Regex

extension Character {
	var unicodeName: String {
		let mutableString = NSMutableString(string: "\(self)")
		CFStringTransform(mutableString, nil, kCFStringTransformToUnicodeName, false)
		let unicodeName = "\(mutableString)".lowercaseString
		let regex = Regex(".*\\{(.*)\\}")
		return regex.match(unicodeName)?.captures.first.flatMap { $0 } ?? unicodeName
	}
}

extension CollectionType where Generator.Element == Character {
	func findUnicodeName(term: String) -> [Character] {
		let regex = Regex(".*\(term).*")
		return self.filter { regex.matches($0.unicodeName) }
	}
}
