# TutorialScrollViewController

[![CI Status](http://img.shields.io/travis/Chenglu Li/TutorialScrollViewController.svg?style=flat)](https://travis-ci.org/Chenglu Li/TutorialScrollViewController)
[![Version](https://img.shields.io/cocoapods/v/TutorialScrollViewController.svg?style=flat)](http://cocoapods.org/pods/TutorialScrollViewController)
[![License](https://img.shields.io/cocoapods/l/TutorialScrollViewController.svg?style=flat)](http://cocoapods.org/pods/TutorialScrollViewController)
[![Platform](https://img.shields.io/cocoapods/p/TutorialScrollViewController.svg?style=flat)](http://cocoapods.org/pods/TutorialScrollViewController)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.
Then, import the framework/library:
```swift
import TutorialScrollViewController
```
Now you are good to use the pod! TutorialScrollViewController is a subclass of PageController. So it would be better if you could change your viewController in storyboard to a pageViewController so that you can customize your "transitionStyle", as it is a read-only property.

To instantiate the controller, simply assign your target viewControllers' storyboard [ids] to this property:

```swift
override func viewDidLoad() {
        super.viewDidLoad()
        
        // Instantiate your viewControllers that you wanna include in the pageController
        self.controllerStoryboardIds = ["Red","Green","Blue"] // Notice: it is an array of ids
    }

```
Build and Run!

[Demo Gif](https://github.com/lichenglu/TutorialScrollViewController/assets/demo.gif)
## Requirements

## Installation

TutorialScrollViewController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "TutorialScrollViewController"
```

## Author

Chenglu Li, kabelee92@gmail.com

## License

TutorialScrollViewController is available under the MIT license. See the LICENSE file for more info.
