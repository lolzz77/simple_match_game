---------
Versions
---------
1. Flutter SDK - 2.5.3 
2. Dart - 2.14.4
3. Gradle - 6.7
4. Java JDK - 15
5. Android Studio - 2023.1.1 Patch 2
6. Kotlin - 1.3.72
7. Groove - 2.5.12
8. Ant - 1.10.8
9. OS - Windows 10 10.0 amd64

--------
Setup
--------
1.Install Android Studio
2. Run `flutter doctor` to ensure everything setup
3. Run `flutter doctor -v`, take note where the flutter will get the Java binary
- Install Java in that directory
3. `cd simple_match_game\flutter_memory_matching_game\`
4. `flutter build apk` (I expect it to fail, i need this command to generate `./gradlew` file)
5. `cd android`
6. `./gradlew --version`
7. `cd ../`
8. `flutter pub get`
9. `flutter run` (i expect it able to open Chrome and run the app)
10. `flutter build apk` (I expect it able to build apk)


--------
Additional Info
--------
1. In case you wan t to change gradle version, do it at `simple_match_game\flutter_memory_matching_game\android\gradle\wrapper\gradle-wrapper.properties`
2. By running `./gradlew --version`, it will auto download & install gradle version specified, it will be put at `C:\Users\User\.gradle\wrapper\dists\`
3. Change Target API version `minimumSdkVersion` & `maximum SdkVersion` at `simple_match_game\flutter_memory_matching_game\android\app\build.gradle`
4. Change app version `flutterVersionName and flutterVersionCode` at `simple_match_game\flutter_memory_matching_game\android\app\build.gradle`
- And also change `version`, by changing the number after `+`, at `simple_match_game\flutter_memory_matching_game\pubspec.yaml`
- eg: `1.0.0+1` to `1.0.0+2`
