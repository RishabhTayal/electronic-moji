import PackageDescription

let package = Package(
  name: "electronic-moji",
  targets: [
    Target(name: "electronic-moji", dependencies: [.Target(name: "Emoji")]),
    Target(name: "generator", dependencies: [.Target(name: "Emoji")]),
  ],
  dependencies: [
    .Package(url: "https://github.com/kylef/Commander.git", majorVersion: 0, minor: 4),
    .Package(url: "https://github.com/sharplet/Regex", majorVersion: 0),
  ],
  testDependencies: [
    .Package(url: "https://github.com/neonichu/spectre-build.git", majorVersion: 0),
  ]
)
