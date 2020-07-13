# NKAlert
[![Version](https://img.shields.io/cocoapods/v/NKAlert.svg?style=flat)](https://cocoapods.org/pods/NKAlert)

NKAlert is a small UI framework to show message in custom alerts, is a alternative to native UIAlert of swift.

<p align="center">
  <img src="Screenshots/screenshot_1.PNG" width=250 alt="Icon"/>
  <img src="Screenshots/screenshot_2.PNG" width=250 alt="Icon"/>
  <img src="Screenshots/screenshot_3.PNG" width=250 alt="Icon"/>
  <img src="Screenshots/screenshot_4.PNG" width=250 alt="Icon"/>
</p>


## Installation

#### Cocoapods

To integrate NKAlert into your Xcode project using CocoaPods, specify it in your Podfile and run pod install.

```
platform :ios, '9.0'
use_frameworks!

pod 'NKAlert', :git => 'https://github.com/Nelkit/NKAlert.git'
```

#### Manually

Download and drop `/NKAlert` folder in your project.


## How to use
```swift
let alert = NKAlert(title: "Success Example", description: "This is a example with NKAlert", style: .SUCCESS)
alert.setButtons(titleOk: "OK")
alert.show(animated: true, completion: {})
```

## License

NKAlert is available under the MIT license. See the LICENSE file for more info.
