output="build/ios_integ"
product="ios/build/ios_integ/Build/Products"
dev_target="15.7"
flutter build ios integration_test/sign_in_test.dart --release

pushd ios

    xcodebuild build-for-testing \
    -workspace Runner.xcworkspace \
    -scheme Runner \
   # -xcconfig Flutter/Release.xcconfig \
    -configuration  Flutter/Release.xcconfig \
    -derivedDataPath \
    "../build/ios_integ" -sdk iphoneos

popd





pushd $product
zip -r "ios_tests.zip" "Release-iphoneos" *.xctestrun 
popd


gcloud firebase test ios run --test="ios/build/ios_integ/Build/Products/ios_tests.zip" \
  --device model=iphone13pro,version=$dev_target,locale=en_US,orientation=portrait \
  --results-bucket=gs://integration-test-f.appspot.com \
  --results-dir=tests/firebase

