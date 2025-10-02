
# Mobile XDK Fiuu (Swift)
Fiuu Mobile XDK for iOS (Swift) is a lightweight SDK that enables seamless integration of the Fiuu payment experience into your iOS mobile applications. It supports payment initiation, status tracking, and in-app redirection — designed for developers who want a native Swift implementation of the Fiuu payment flow.

# Features
- Easy integration with native Swift apps
- Support for payment creation and status polling
- Secure token-based communication
- Configurable UI options for redirection
- Lightweight and modular

# Requirements
- iOS 16.0+
- Swift 5.0+
- Xcode 14+

# Installation

Add this line in Podfile

```ruby
pod 'FiuuXDKSwift', :git => 'https://github.com/FiuuPayment/Mobile-XDK-Fiuu_Swift.git'
```

or

Add this line to your Podfile:

```ruby
pod 'FiuuXDKSwift'
```

# Apple Pay Implementation

- Apple Developer Account
- Enable:
    - Apple Pay capability in Xcode project (Project> Targets> Signing & Capabilities> + Capilibity)
    - Merchant ID (in Apple Developer portal), different from bundle identifier

# Params needed for Apple Pay

```ruby
"mp_channel": "ApplePay"
"mp_express_mode": true // Optional
"mp_allowed_channels": ["ApplePay"]
"mp_ap_merchant_ID": "Merchant ID"
```

# Example of implementation

- Swift usage: -

```ruby
    let paymentDetails: [String: Any] = [:] // Should add the parameters needed
    let vc = FiuuXDKController(with: paymentDetails)
        
    let navController = UINavigationController(rootViewController: vc)
    navController.modalPresentationStyle = .fullScreen
        
    vc.startXDK { [weak self] result in
        navController.dismiss(animated: true)
        guard let self = self else { return }
        switch result {
        case .success(let data):
            print("RESULTS: \(data)")
        case .failure:
            print("ERROR!")
        }
    }
        
    self.present(navController, animated: true)
```

- For swiftUI, you need to create a struct conform to UIViewControllerRepresentable
- Below are the example to use the representable struct: -

```ruby
struct FiuuXDKWrapper: UIViewControllerRepresentable {
    
    typealias CompletionHandler = (Result<String, Error>) -> Void
    var onResults: CompletionHandler  // Closure from SwiftUI
    
    func makeUIViewController(context: Context) -> UINavigationController {
        
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMddkkmmss"
        let orderId = formatter.string(from: now)
        
        let paymentDetails: [String: Any] = [
            //default values
            "mp_username": "",
            "mp_password": "",
            "mp_merchant_ID": "",
            "mp_app_name": "",
            "mp_verification_key": "",
            "mp_ap_merchant_ID": "",
        ];
        
        let vc = FiuuXDKController(with: paymentDetails)
        vc.startXDK(completion: onResults)
        let navController = UINavigationController(rootViewController: vc)
        return navController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // Optional update logic
    }
}
    
```

```ruby
struct ContentView: View {
    
    @State private var labelText = "Waiting for RESULTS..."
    @State private var showVC = false
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            VStack {
                Text(labelText)
                    .font(.title)
                    .multilineTextAlignment(.center)
                
                Button("START") {
                    showVC = true
                }
                .padding()
                .background(Color.brown)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding()
            .fullScreenCover(isPresented: $showVC) {
                FiuuXDKWrapper { results in
                    showVC = false
                    switch results {
                    case .success(let data):
                        self.labelText = "RESULTS: \(data)"
                    case .failure(_):
                        self.labelText = "ERROR!"
                    }
                }
            }
        }
    }
}

```
# Environment Configuration

The library supports multiple environments. You can configure which environment to use by setting the `mp_core_env` value.

`mp_core_env` is a string ("1", "2", "3", "4")

Each value maps to a specific environment base URL.

If no value is set, the default environment will be used.

| `mp_core_env` Value | Environment | Base URL                            |
| --------------- | -----------      | ----------------------------------- |
| `1`             | Production - V1  | `https://pay.fiuu.com/RMS/API/xdk/` |
| `2`             | Production - V2  | `https://xdk.fiuu.com/`             |
| `3`             | UAT - V2         | `https://uat-xdk.fiuu.com/`         |
| `4`             | Sandbox -V2      | `https://sandbox-xdk.fiuu.com/`     |
| *Default*       | Production - V2  | `https://xdk.fiuu.com/`             |

