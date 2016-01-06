import Foundation
import Regex

private let url = NSURL(string: "http://unicode.org/emoji/charts/full-emoji-list.html")!

/// Fetch list of emoji characters from Unicode.org
func all_emoji(completion: ([Character]) -> ()) -> NSURLSessionDataTask {
	let config = NSURLSessionConfiguration.defaultSessionConfiguration()
	let session = NSURLSession(configuration: config)

	let task = session.dataTaskWithURL(url) { data, _, _ in
		if let data = data, htmlString = NSString(data: data, encoding: NSUTF8StringEncoding) as? String {
			let regex = Regex("<td class='chars'>(.*)</td>")
			let emoji = regex.allMatches(htmlString).flatMap { $0.captures.first }.flatMap { $0 }
			completion(emoji.flatMap { $0.characters.first })
		} else {
			completion([Character]())
		}
	}
	
	task.resume()
	return task
}

func generate_swift_code(chars: [Character]) -> String {
	let all_chars = chars.map { "\"\($0)\"" }.joinWithSeparator(",")
	return "public let EMOJI: [Character] = [ \(all_chars) ]"
}
