FRAMEWORK=$1

echo "${FRAMEWORK} Checksum:"
swift package compute-checksum ./build/${FRAMEWORK}.xcframework.zip