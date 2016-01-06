import AppKit
import Commander
import Emoji

command { (arg: String) in
	print(EMOJI.findUnicodeName(arg))
}.run()
