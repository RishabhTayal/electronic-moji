BUILD_DIR=./.build/debug

.PHONY: all clean lib test

all: lib
	$(BUILD_DIR)/electronic-moji smiling

clean:
	swift build --clean

lib:
	swift build

test: lib
	$(BUILD_DIR)/spectre-build

Sources/Emoji/AllEmoji.swift:
	$(BUILD_DIR)/generator >$@
