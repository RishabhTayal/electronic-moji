import AppKit
import Commander

command { (arg: String) in
	NSApplicationLoad()

	all_emoji { emojis in
		print(emojis.findUnicodeName(arg))
		exit(0)
	}

	NSApp.run()
}.run()
