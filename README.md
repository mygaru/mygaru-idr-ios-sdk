# myGaru Ident iOS SDK

`myGaruIdent` is an iOS framework that provides a simple API to:

1. Request a one-time token (`OTP`) from myGaru Ident service.
2. Exchange that token for a persistent user identifier (`PUID`).

## 📦 Requirements

- iOS 14.0+
- Xcode 15.3+
- Swift 5+

---

## Overview

Main entry point:

- `MyGaruIdent(partnerID: String)`

Public methods:

- `getOTP() async throws -> String`
- `getOTP(completion: @escaping @Sendable (Result<String, Error>) -> Void)`
- `getPUID(otp: String) async throws -> String`
- `getPUID(otp: String, completion: @escaping @Sendable (Result<String, Error>) -> Void)`

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
        from: "0.0.2"
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

## Usage (Async/Await)

```swift
import Foundation
import myGaruIdent

final class IdentService {
    private let ident = MyGaruIdent(partnerID: "YOUR_PARTNER_ID")

    func fetchPUID() async {
        do {
            let otp = try await ident.getOTP()
            let puid = try await ident.getPUID(otp: otp)
            print("PUID:", puid)
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

let ident = MyGaruIdent(partnerID: "YOUR_PARTNER_ID")

ident.getOTP { result in
    switch result {
    case .success(let otp):
        ident.getPUID(otp: otp) { result in
            switch result {
            case .success(let puid):
                print("PUID:", puid)
            case .failure(let error):
                print("PUID error:", error.localizedDescription)
            }
        }

    case .failure(let error):
        print("OTP error:", error.localizedDescription)
    }
}
```
