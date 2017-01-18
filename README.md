# TODO-Foundation
Swift Package holding the data structures for TODO project. The intention is to reuse data structures both in [backend](https://github.com/pajapro/TODO-Backend) and [iOS app](https://github.com/pajapro/TODO-iOS).

## 💉 Installation
Add the following dependency to your `Package.swift` manifest file:
``` swift
.Package(url: "https://github.com/pajapro/TODO-Foundation.git", majorVersion: 1)
```

## 📦 Compile & tests
Run `swift build` to start the Swift build process. If everything worked correctly, it will compile the Swift module for TODO-Foundation. To run the tests for this package, use: `swift test`.

## 🛠 Xcode project
This repo does not include an Xcode project. If you want to generate one locally, use `swift package generate-xcodeproj` command.
