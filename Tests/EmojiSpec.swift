import Spectre
import Emoji

func describeEmojiSearch() {
  describe("searching emoji") {
    $0.it("can get the unicode name of an emoji") {
      try expect(Character("🤖").unicodeName) == "robot face"
    }

    $0.it("can get the emoji of a unicode name string") {
      try expect("cat face".emoji) == Character("🐱")
    }

    $0.it("can find a set of emoji using FTS on unicode names") {
      try expect(EMOJI.findUnicodeName("burrito").first) == Character("🌯")
    }
  }
}