# NKAlert
[![Version](https://img.shields.io/cocoapods/v/NKAlert.svg?style=flat)](https://cocoapods.org/pods/NKAlert)

NKAlert is a small UI framework to show message in custom alerts, is a alternative to native UIAlert of swift.

<p align="center">
  <img src="https://raw.githubusercontent.com/Nelkit/NKAlert/master/screenshots/screenshot_1.PNG" width=250 alt="Icon"/>
  <img src="https://raw.githubusercontent.com/Nelkit/NKAlert/master/screenshots/screenshot_2.PNG" width=250 alt="Icon"/>
  <img src="https://raw.githubusercontent.com/Nelkit/NKAlert/master/screenshots/screenshot_3.PNG" width=250 alt="Icon"/>
  <img src="https://raw.githubusercontent.com/Nelkit/NKAlert/master/screenshots/screenshot_4.PNG" width=250 alt="Icon"/>
</p>


## Installation

#### Cocoapods

To integrate NKAlert into your Xcode project using CocoaPods, specify it in your Podfile and run pod install.

```
target 'MyApp' do
  pod 'NKAlert', '~> 0.0'
end
```

#### Manually

Download and drop `/NKAlert` folder in your project.


## How to use
```swift
let alert = NKAlert(title: "Success Example", description: "This is a example with NKAlert", style: .SUCCESS)
alert.setButtons(titleOk: "OK")
alert.show(animated: true, completion: {})
```

<img src="https://raw.githubusercontent.com/Nelkit/NKAlert/master/screenshots/success_1.gif" width=250 alt="Icon"/>

## License

NKAlert is available under the MIT license. See the LICENSE file for more info.
