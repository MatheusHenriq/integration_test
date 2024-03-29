pushd android

flutter build apk

./gradlew app:assembleAndroidTest

./gradlew app:assembleDebug -Ptarget="integration_test/sign_in_test.dart"
    
popd