// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "roman",
  products: [
      .executable(name: "roman", targets: ["roman"]),
      .library(name: "RomanNumerals", targets: ["RomanNumerals"])
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "roman",
      dependencies: ["RomanNumerals"]),
    .target(
      name: "RomanNumerals",
      dependencies: []),
    .testTarget(
      name: "RomanNumeralsTests",
      dependencies: ["RomanNumerals"]),
  ]
)
