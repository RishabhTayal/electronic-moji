import AppKit
import Emoji

NSApplicationLoad()

all_emoji { emojis in
	print(generate_swift_code(emojis))
	exit(0)
}

NSApp.run()
