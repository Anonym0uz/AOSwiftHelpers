# AOSwiftHelpers
Swift helpers for you!

[![Version](https://img.shields.io/cocoapods/v/AOSwiftHelpers.svg?style=flat)](http://cocoapods.org/pods/AOSwiftHelpers)
[![License](https://img.shields.io/cocoapods/l/AOSwiftHelpers.svg?style=flat)](http://cocoapods.org/pods/AOSwiftHelpers)
[![Platform](https://img.shields.io/cocoapods/p/AOSwiftHelpers.svg?style=flat)](http://cocoapods.org/pods/AOSwiftHelpers)

**Support iOS 10 or newer**
**Build in XCode 10.1 with Swift 4.2**

### Menu
1) [Installation](https://github.com/Anonym0uz/AOSwiftHelpers#installation)
2) [Features](https://github.com/Anonym0uz/AOSwiftHelpers#features)
3) [Usage](https://github.com/Anonym0uz/AOSwiftHelpers#usage)
4) [Author](https://github.com/Anonym0uz/AOSwiftHelpers#author)

## Features
#### UIHelpers
Create view or button with minimum (or in one-line) code? Or you need setup constraints in one-line code? Easy-peasy!
In this helper, we not need to use ```.addSubview(ourView)```, this replaced to ```...parentView: superview)```

#### Logger helper
You can use advanced log in your project, like as:
``` 
‼️ [AOSwiftHelpersExample] 05/05/2019 19:25:04:557 ‼️
[AOLogger -->] File: ViewController.swift
[AOLogger -->] Func: viewDidLoad()
[AOLogger -->] Line: 16
[AOLogger -->] Desc: Test log!
```
## Installation
AOSwiftHelpers is available through [CocoaPods](https://cocoapods.org). To install it, add following line to your Podfile:
```ruby
pod 'AOSwiftHelpers'
```
after install complete, import library to your project
```Swift
import AOSwiftHelpers
```

or manually, just copy AOSwiftHelpers.framework to your project and import it.

## Usage
### UIHelpers
#### Views
For example, we need to create 2 views:
```Swift
let testView = AOSwiftHelpers.sharedUI.setupView(backgroundColor: UIColor.black, rounded: true, cornerRadius: 10, border: true, borderWidth: 1.0, borderColor: UIColor.red, parentView: self.view)

let testView2 = AOSwiftHelpers.sharedUI.setupView(backgroundColor: UIColor.red, parentView: self.view)
```
In first example we setup view in one-line code, with include all we need features:
```Swift
backgroundColor: UIColor
rounded: Bool (default = false) (if rounded true, view.clipToBounds automatically is true)
cornerRadius: CGFloat (default = 0)
border: Bool (default = false)
borderColor: Bool (default = .black)
parentView: UIView
```
In second example we setup view in one-line code, without many features (if we want setup all by self): 
```Swift
backgroundColor: UIColor
parentView: UIView
```
#### Constraints
In this helper we can setup costraints in one-line code by using ```UIKit``` extensions.
For example:
```Swift
if #available(iOS 11.0, *) {
testView.setupAnchor(top: view.safeArea.top, left: view.safeArea.left, bottom: nil, right: view.safeArea.right, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 200))
testView2.setupAnchor(top: testView.bottom, left: view.left, bottom: nil, right: view.right, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
testView2.setAnchorSize(to: testView)

} else {
// Fallback on earlier versions
testView.setupAnchor(top: view.top, left: view.left, bottom: nil, right: view.left, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 200))
testView2.setupAnchor(top: testView.bottom, left: view.left, bottom: nil, right: view.right, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
testView2.setAnchorSize(to: testView)
}
```
```topAnchor, bottomAnchor, leftAnchor, rightAnchor, (for iOS 11)safeAreaLayoutGuide``` replaced by ```top, bottom, left, right, safeArea```
### Logger
We need setup logger  ```debugBuild``` in ```AppDelegate.swift``` method:
```Swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
AOSwiftHelpers.sharedLogger.setupLogger(debugBuild: true)
return true
}
```
Now we can use logger in debug mode:
```Swift
AOSwiftHelpers.sharedLogger.AOLog("Test log!")
```
**Output:**
```
‼️ Debug mode turn ON ‼️
‼️ [AOSwiftHelpersExample] 05/05/2019 19:25:04:557 ‼️
[AOLogger -->] File: ViewController.swift
[AOLogger -->] Func: viewDidLoad()
[AOLogger -->] Line: 16
[AOLogger -->] Desc: Test log!
```
And we'll see time, file where call log, function, line and our description.
If ```(debugBuild: false)``` - is disable log message and output will be:
```
‼️ Debug mode turn OFF ‼️
Build in production state!
```

## Author
[Anonym0uz](https://github.com/Anonym0uz)
#### Special thanks
[Lets Build That App](https://www.letsbuildthatapp.com) for some extensions.

## License
AOSwiftHelpers is available under the MIT license. See the LICENSE file for more info.
