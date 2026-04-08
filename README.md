# myGaru Ident iOS SDK

`myGaruIdent` is an iOS framework that provides a simple API to request a one-time token (`OTP`) from myGaru Ident service.

## 📦 Requirements

- iOS 14.0+
- Xcode 15.3+
- Swift 5+

---

## Overview

Main entry point:

- `MyGaruIdent()`

Public methods:

- `getOTP() async throws -> String`
- `getOTP(completion: @escaping @Sendable (Result<String, Error>) -> Void)`

## Integration (Swift Package Manager)

### Option 1 — Xcode UI

1. Open your project in Xcode.
2. Go to **File → Add Packages...**
3. Enter the repository URL:

```
https://github.com/mygaru/mygaru-idr-ios-sdk
```

4. Choose **Up to Next Major Version**
5. Select the latest available version.
6. Add the package to your app target.

---

### Option 2 — Package.swift

Add the dependency:

```swift
dependencies: [
    .package(
        url: "https://github.com/mygaru/mygaru-idr-ios-sdk",
        from: "0.0.4"
    )
]
```

Add the product to your target:

```swift
.target(
    name: "YourApp",
    dependencies: [
        .product(name: "myGaruIdent", package: "myGaruIdent")
    ]
)
```

```swift
import Foundation
import myGaruIdent

final class IdentService {
    private let ident = MyGaruIdent()

    func fetchPUID() async {
        do {
            let otp = try await ident.getOTP()
            print("OTP:", otp)
        } catch {
            print("Ident error:", error.localizedDescription)
        }
    }
}
```

## Usage (Completion Handlers)

```swift
import Foundation
import myGaruIdent

let ident = MyGaruIdent()

ident.getOTP { result in
    switch result {
    case .success(let otp):
        print("OTP:", otp)
    case .failure(let error):
        print("OTP error:", error.localizedDescription)
    }
}
```
