// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIKeyboardAnimatable",
    platforms: [.iOS(.v10)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "UIKeyboardAnimatable",
            targets: ["UIKeyboardAnimatable"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/ipedro/ObjectAssociation.git", from: "0.1.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "UIKeyboardAnimatable",
            dependencies: [
                ._byNameItem(name: "ObjectAssociation", condition: nil)
            ]),
        .testTarget(
            name: "UIKeyboardAnimatableTests",
            dependencies: ["UIKeyboardAnimatable"]),
    ]
)
