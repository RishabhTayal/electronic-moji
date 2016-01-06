import AppKit
import Commander
import Emoji

command { (arg: String) in
	print(EMOJI.findUnicodeName(arg).map { "\($0)" }.joinWithSeparator("  "))
}.run()
