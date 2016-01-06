.PHONY: all clean

all:
	swift build
	./.build/debug/electronic-moji smiling

clean:
	swift build --clean

