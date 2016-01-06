BUILD_DIR=./.build/debug

.PHONY: all clean lib

all: lib
	$(BUILD_DIR)/electronic-moji smiling

clean:
	swift build --clean

lib:
	swift build

Sources/Emoji/AllEmoji.swift:
	$(BUILD_DIR)/generator >$@
