# Webtoon Record App

This repository contains a simple SwiftUI example for managing personal webtoon records. The app demonstrates how you might track your favorite webtoons, rate them and view additional details.

## Features
- List of webtoons with thumbnail cards
- Detail page with episodes, info and review tabs
- Support for personal ratings, studios and reading status

All code is located under `WebtoonRecordApp/Sources`.

### Running in Xcode

1. Open `Package.swift` in Xcode (`File > Open`).
2. Select the **WebtoonRecordApp** scheme.
3. Choose an iOS simulator running iOS 15 or later and build.

`swift build` in this environment fails because it lacks the `SwiftUI` SDK.
