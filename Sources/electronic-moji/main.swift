import AppKit
import Commander
import Emoji

func fillPasteboard(contents: String) {
	let pboard = NSPasteboard.generalPasteboard()
	pboard.clearContents()
	pboard.setData(contents.dataUsingEncoding(NSUTF8StringEncoding), forType: NSPasteboardTypeString)
}

command { (arg: String) in
	let matchStrings = EMOJI.findUnicodeName(arg).map { "\($0)" }
	print(matchStrings.joinWithSeparator("  "))

	if let string = matchStrings.first {
		fillPasteboard(string)
	}
}.run()
