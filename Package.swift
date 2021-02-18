// swift-tools-version:5.3

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
    .package(name: "RxSwift", url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.1.0"))
  ],
  targets: [
    .target(
      name: "AKRxExtensions",
      dependencies: [
        .product(name: "RxRelay", package: "RxSwift"),
        .product(name: "RxSwift", package: "RxSwift")
      ]
    ),
    .target(
      name: "AKRxCocoaExtensions",
      dependencies: [
        .product(name: "RxCocoa", package: "RxSwift"),
        .product(name: "RxSwift", package: "RxSwift")
      ]
    )
  ]
)
