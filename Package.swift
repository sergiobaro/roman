// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "roman",
  products: [
      .library(name: "RomanCalculator", targets: ["RomanCalculator"])
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "RomanCalculator",
      dependencies: []),
    .testTarget(
      name: "RomanCalculatorTests",
      dependencies: ["RomanCalculator"]),
  ]
)
