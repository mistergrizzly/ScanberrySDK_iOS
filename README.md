# Scanberry SDK iOS documentation

## Getting started

At the moment Scanberry SDK - iOS version, can be imported and run for real device architecture only. Please drag and drop ScanberrySDK.framework to your project and don't forget to specify for the Frameworks, Libraries and Embedded Content:

```Swift
Embed & Sign'
```

### Add ScanBerry SDK License Key (AppDelegate):

```Swift
 func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    ScanberrySDK.default.initialize(with: "YOUR_LICENSE_KEY")
    
    return true
  }
```

### Initialize SDK

```Swift
let scanberrySDK = ScanberrySDK.default
```

## Ready to use Camera & Edit
ScanBerry SDK provides ready to use UI for document detection with user guidance, cropping, image enhancing, optical character recognition, PDF creation. 
To start the document detection flow, use below code:
```Swift
  /// Get camera controller
  let controller = ScanberrySDK.default.getCameraController(with: configuration, delegate: self, image: nil)
  
  // Return edit controller
  let controller = ScanberrySDK.default.getCameraController(with: configuration, delegate: self, image: image)
```


## Image processing & PDF creation
Apart from ready to use ui, there is an API that can be used individually to detect document edges and getting document's corners, cropping a document based on the detected corners, enhancing a document that can be used for a better text recognition, and also getting text from the image.
Firstly we need to get an instance of `SBSDKRecognition`, then use it as shown below:
```swift
var manager: SBSDKRecognition?

// Initialize Manager
viewDidLoad: manager = SBSDKRecognition(language: .english, dataSource: Bundle.main, engineMode: .tesseractOnly)

Where .english is the OCR language loaded to tessdata folder, datasource is the bundle where you have loaded the tessdata folder with languages and engineMode - is the advanced recognition capability

// Recognize images and get text
let result = manager?.recognize(image: image)

// Recognize images and transform to sandwich PDF
let pdfData = try? manager?.createSandwichPDF(from: [image])
```

# Step by step integration


