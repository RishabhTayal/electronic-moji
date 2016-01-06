import PackageDescription

let package = Package(
  name: "electronic-moji",
  dependencies: [
    .Package(url: "https://github.com/kylef/Commander.git", majorVersion: 0, minor: 4),
    .Package(url: "https://github.com/sharplet/Regex", majorVersion: 0),
  ]
)
