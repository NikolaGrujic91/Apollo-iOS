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
* [Dependency graph](#dependency-graph)
* [Tests](#tests)
* [Static analysis](#static-analysis)

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
* Calories spent
* Integrated with Apple Health for reading weight
* Works completely offline
* Dark theme
* Languages (en, nl)
* Swipe between tabs

## Usage

![Plans](./Assets/ProductDetailsChart.mov.gif)

![Timer](./Assets/Search.mov.gif)

![Settings](./Assets/Settings.mov.gif)

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
    ApolloApp[ApolloApp] --> ApolloUI[ApolloUI]
    
    ApolloUI --> ApolloData[ApolloData]
    ApolloUI --> ApolloLogger[ApolloLogger]
    ApolloUI --> ApolloTheme[ApolloTheme]
    ApolloUI --> ApolloLocalization[ApolloLocalization]
    ApolloUI --> ApolloImages[ApolloImages]
    ApolloUI --> ApolloWeight[ApolloWeight]
    ApolloUI --> ApolloLocation[ApolloLocation]
    ApolloUI --> ApolloAudio[ApolloAudio]

    ApolloData --> ApolloLogger[ApolloLogger]

    ApolloLogger --> CocoaLumberJack[CocoaLumberJack]

    ApolloWeight --> ApolloLogger[ApolloLogger]

    ApolloLocation --> ApolloLogger[ApolloLogger]

    ApolloAudio --> ApolloLogger[ApolloLogger]

    ApolloLocalization --> ApolloLogger[ApolloLogger]
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

## Tests

Install xcpretty:

```shell
./Scripts/tests/install_xcpretty.sh
```

Run unit tests:

```shell
./Scripts/tests/run_unit_tests.sh
```

## Static analysis

To find duplicated code run [jscpd](https://github.com/kucherenko/jscpd)

Install jscpd:

```shell
./Scripts/jscpd/install_jscpd.sh
```

Run jscpd:

```shell
./Scripts/jscpd/run_jscpd.sh
```

To analyze code complexity run [lizard](https://github.com/terryyin/lizard)

Install lizard:

```shell
./Scripts/lizard/install_lizard.sh
```

Run lizard:

```shell
./Scripts/lizard/run_lizard.sh
```

To format code  run [swiftformat](https://github.com/nicklockwood/SwiftFormat)

Install swiftformat:

```shell
./Scripts/swiftformat/install_swiftformat.sh
```

Run swiftformat:

```shell
./Scripts/swiftformat/run_swiftformat.sh
```
