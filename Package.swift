// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "WebtoonRecordApp",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .executable(
            name: "WebtoonRecordApp",
            targets: ["WebtoonRecordApp"]
        )
    ],
    targets: [
        .executableTarget(
            name: "WebtoonRecordApp",
            path: "WebtoonRecordApp/Sources"
        )
    ]
)
