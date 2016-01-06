import Foundation
import Regex

extension Character {
	public var unicodeName: String {
		let mutableString = NSMutableString(string: "\(self)")
		CFStringTransform(mutableString, nil, kCFStringTransformToUnicodeName, false)
		let unicodeName = "\(mutableString)".lowercaseString
		let regex = Regex(".*\\{(.*)\\}")
		return regex.match(unicodeName)?.captures.first.flatMap { $0 } ?? unicodeName
	}
}

extension String {
	public var emoji: Character? {
		let mutableString = NSMutableString(string: "\\n{\(self)}".uppercaseString)
		CFStringTransform(mutableString, nil, kCFStringTransformToUnicodeName, true)
		return "\(mutableString)".characters.first
	}
}

extension CollectionType where Generator.Element == Character {
	public func findUnicodeName(term: String) -> [Character] {
		let regex = Regex(".*\(term).*")
		return self.filter { regex.matches($0.unicodeName) }
	}
}
