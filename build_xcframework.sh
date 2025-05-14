#!/bin/bash

# Set up variables
FRAMEWORK_NAME="Cluster"
SIMULATOR_ARCHIVE_PATH="./build/simulator.xcarchive"
IOS_ARCHIVE_PATH="./build/ios.xcarchive"
XCFRAMEWORK_PATH="./build/${FRAMEWORK_NAME}.xcframework"

# Clean previous build
rm -rf ./build
mkdir -p ./build

# Build for iOS Simulator
xcodebuild archive \
    -scheme ${FRAMEWORK_NAME} \
    -project "${FRAMEWORK_NAME}.xcodeproj" \
    -destination "generic/platform=iOS Simulator" \
    -archivePath ${SIMULATOR_ARCHIVE_PATH} \
    -sdk iphonesimulator \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
    ENABLE_BITCODE=NO \
    ARCHS="x86_64 arm64" \
    ONLY_ACTIVE_ARCH=NO

# Build for iOS Device
xcodebuild archive \
    -scheme ${FRAMEWORK_NAME} \
    -project "${FRAMEWORK_NAME}.xcodeproj" \
    -destination "generic/platform=iOS" \
    -archivePath ${IOS_ARCHIVE_PATH} \
    -sdk iphoneos \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
    ENABLE_BITCODE=NO

# Create XCFramework
xcodebuild -create-xcframework \
    -framework "${SIMULATOR_ARCHIVE_PATH}/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework" \
    -framework "${IOS_ARCHIVE_PATH}/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework" \
    -output "${XCFRAMEWORK_PATH}"

echo "✅ XCFramework created at ${XCFRAMEWORK_PATH}"