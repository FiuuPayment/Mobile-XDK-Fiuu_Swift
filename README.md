
# 📱 Mobile XDK Fiuu (Swift)
Fiuu Mobile XDK for iOS (Swift) is a lightweight SDK that enables seamless integration of the Fiuu payment experience into your iOS mobile applications. It supports payment initiation, status tracking, and in-app redirection — designed for developers who want a native Swift implementation of the Fiuu payment flow.

# ✨ Features
- Easy integration with native Swift apps
- Support for payment creation and status polling
- Secure token-based communication
- Configurable UI options for redirection
- Lightweight and modular

# 🔧 Requirements
- iOS 13.0+
- Swift 5+
- Xcode 14+

# Installation

Add this line in Podfile

```
pod 'FiuuXDKSwift', :git => 'https://github.com/FiuuPayment/Mobile-XDK-Fiuu_Swift.git'
```

or

```
pod 'FiuuXDKSwift', '~>, <version number>'
```

# Apple Pay Implementation

- Apple Developer Account
- Enable:
    - Apple Pay capability in Xcode project (Project> Targets> Signing & Capabilities> + Capilibity)
    - Merchant ID (in Apple Developer portal), different from bundle identifier

# Params needed for Apple Pay

```
"mp_channel": "ApplePay"
"mp_express_mode": true // Optional
"mp_allowed_channels": ["ApplePay"]
"mp_ap_merchant_ID": "Merchant ID"
```
