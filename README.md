# TFL Coding Challenge #
A Demo app displaying the status of tube lines accessing TFL REST API at https://api.tfl.gov.uk

## Overview and Configuration details ##

* The app has been built using the latest Xcode 14.1 and Swift version 5.7.1
* Used SwiftUI, async/await apis for clean networking
* MVVM architectural pattern followed for seggregation of concerns and improved unit testability
* Dependency Injection followed wherever applicable
* Followed SOLID principles
* Test Coverage for ViewModels and Repositories
* App doesn't need any credentials or API Key to run

## Usage
- Clone the repository locally
- Open up the project TFL.xcodeproj
- Build and run the app

# Preview
<img src="/TFLTubeStatus.png"/>

### **Further improvements that could be done with additional time**
- Localisation
- Linting with `SwiftLint`, Formating with `SwiftFormat`
- Support for XCUITests
- Support for Snapshot Tests using PointFree SDK
- Better Error Handling
- Support for Dynamic fonts
- Modularisation and SPM

