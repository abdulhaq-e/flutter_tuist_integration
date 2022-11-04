
import ProjectDescription

let targetName = "Runner"
let targetPath = "Runner/"

let project = Project(
    name: targetName,
    organizationName: "Flutter Tuist",
    targets: [
        Target(
            name: targetName,
            platform: .iOS,
            product: .app,
            bundleId: "com.flutter.tuist",
            infoPlist: "App-Info.plist",
            sources: ["\(targetPath)/**",
                      "Flutter/AppFrameworkInfo.plist",
                      "Flutter/Generated.xcconfig",
                      "Flutter/Debug.xcconfig",
                      "Flutter/Release.xcconfig"
            ],
            resources: [
                .folderReference(path: "\(targetPath)/Assets.xcassets"),
                .glob(pattern: "\(targetPath)/Base.lproj/**"),

            ],
            scripts: [
                .pre(script: "/bin/sh $SRCROOT/target_scripts/run_scripts.sh", name: "Run Scripts"),
                .post(script: "/bin/sh $SRCROOT/target_scripts/thin_binary.sh", name: "Thin Binary")
            ],
            dependencies: [],
            settings: .settings(base: [
                                  "SWIFT_OBJC_BRIDGING_HEADER": .string("\(targetPath)/Runner-Bridging-Header.h")],
                                configurations: [
                .debug(name: .debug, xcconfig: .relativeToManifest("Flutter/Debug.xcconfig")),
                .release(name: .release, xcconfig: .relativeToManifest("Flutter/Release.xcconfig"))
            ])
        )
    ]
)
