# Apollo

<p align="center">
    <img src="./Assets/Logo.png" width="200" height="200">
</p>

![PlatformIOS](https://img.shields.io/badge/Platform-iOS-lightgrey)
![SwiftUI](https://img.shields.io/badge/Framework-SwiftUI-blue)
![Language](https://img.shields.io/badge/Language-Swift-blue)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/NikolaGrujic91/garden_planner_app/graphs/commit-activity)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![style: swift lint](https://img.shields.io/badge/Lint-SwiftLint-B22C89)](https://github.com/lukepistrol/SwiftLintPlugin)
[![style: swift formater](https://img.shields.io/badge/Formater-SwiftFormat-B22C89)](https://github.com/nicklockwood/SwiftFormat)

## Table of contents

* [General info](#general-info)
* [Features](#features)
* [Usage](#usage)
* [Requirements](#requirements)
* [Architecture](#architecture)
* [Fastlane](#fastlane)
* [Dependency graph](#dependency-graph)
* [License](#license)

## General info

Apollo is a running tracker app.

Available on iOS.

## Features

* Running plans:
  * 0 to 2K
  * 0 to 5K
  * 5K to 10k
  * Weight Loss: Level 1
  * Weight Loss: Level 2
  * Weight Loss: Level 3
* Distance tracking
* Calories burned
* Integrated with Apple Health for reading weight
* Works completely offline
* Dark theme
* Languages (en, nl)
* Swipe between tabs

## Usage

<p align="middle">
  <img src="./Screenshots/en-US/iPhone%2014%20Pro-1.%20Plans.png" height="500">
  <img src="./Screenshots/en-US/iPhone%2014%20Pro-2.%20Weeks.png" height="500">
  <img src="./Screenshots/en-US/iPhone%2014%20Pro-3.%20Days.png" height="500">
  <img src="./Screenshots/en-US/iPhone%2014%20Pro-4.%20Timer.png" height="500">
  <img src="./Screenshots/en-US/iPhone%2014%20Pro-5.%20Timer.png" height="500">
  <img src="./Screenshots/en-US/iPhone%2014%20Pro-6.%20Settings.png" height="500">
</p>

## Requirements

This project requires:

* XCode 14
* iOS 16 (device or simulator)

## Architecture

Architecture of the application is based on the microapps/microfeatures architecture.

[Meet the microapps architecture](https://increment.com/mobile/microapps-architecture/)

[Get started/Building at scale/µFeatures Architecture](https://docs.tuist.io/tutorial/get-started)

```mermaid
graph TD
    ApolloApp[ApolloApp] --> FeaturePlans[FeaturePlans]
    ApolloApp[ApolloApp] --> FeatureSettings[FeatureSettings]
    
    FeaturePlans --> FeatureSettings[FeatureSettings]
    FeaturePlans --> FoundationData[FoundationData]
    FeaturePlans --> FoundationLocation[FoundationLocation]
    FeaturePlans --> FoundationAudio[FoundationAudio]
    FeaturePlans --> FoundationImages[FoundationImages]
    FeaturePlans --> UtilityExtensions[UtilityExtensions]

    FeatureSettings --> FoundationData[FoundationData]
    FeatureSettings --> FoundationLogger[FoundationLogger]
    FeatureSettings --> FoundationLocalization[FoundationLocalization]
    FeatureSettings --> FoundationStorage[FoundationStorage]
    FeatureSettings --> UtilityExtensions[UtilityExtensions]

    FoundationData --> FoundationStorage[FoundationStorage]
    FoundationData --> FoundationLogger[FoundationLogger]

    FoundationLocation --> FoundationLogger[FoundationLogger]

    FoundationAudio --> FoundationLogger[FoundationLogger]

    FoundationLocalization --> FoundationLogger[FoundationLogger]

    FoundationLogger --> CocoaLumberjack[CocoaLumberjack]
```

## Fastlane

```shell
brew install fastlane
```

## Available Actions

Navigate to *fastlane* folder and run actions from terminal.

### Build debug

```shell
fastlane ios build_debug
```

### Build release

```shell
fastlane ios build_release
```

### Create screenshots

```shell
fastlane ios screenshots
```

### Tests with code coverage

```shell
fastlane ios tests
```

## Dependency graph

Detailed dependency graph can be found at:

```text
./DependencyGraph/html/emerge.html
```

It is generated using the [emerge](https://github.com/glato/emerge)

Install emerge:

```shell
./Scripts/emerge/install_emerge.sh
```

Generate new dependency graph:

```shell
./Scripts/emerge/run_emerge.sh
```

## License

This project is licensed under the GNU GPL v3 License - see the [LICENSE.md](https://github.com/NikolaGrujic91/Apollo-iOS/blob/master/LICENSE.md) file for details.