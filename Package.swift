// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "AKRxExtensions",
  platforms: [
    .macOS(.v10_13), .iOS(.v12), .tvOS(.v12), .watchOS(.v5)
  ],
  products: [
    .library(
      name: "AKRxExtensions",
      targets: ["AKRxExtensions"]
    ),
    .library(
      name: "AKRxCocoaExtensions",
      targets: ["AKRxCocoaExtensions"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "5.0.0")
  ],
  targets: [
    .target(
      name: "AKRxExtensions",
      dependencies: [
        "RxSwift"
      ]
    ),
    .target(
      name: "AKRxCocoaExtensions",
      dependencies: [
        "RxCocoa",
        "RxSwift"
      ]
    )
  ]
)
