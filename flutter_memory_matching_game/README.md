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
1. Install Android Studio
2. Install Flutter
3. Set windows `PATH` environment, put `D:\tools\flutter\bin`
4. Run `flutter doctor -v`, to ensure everything setup, follow their instruction
5. Install Java 
6. Then, copy the JAVA content `D:\Program Files\Java\jdk-15` to `D:\Program Files\Android\Android Studio\jre`
7. In Android Studio, open project at this path `simple_match_game\flutter_memory_matching_game`

-------
Run the app
-------
1. `flutter pub get`
2. `flutter run`
3. Chrome browser should open up and the apps should run

------
Build the app
------
1. `flutter build apk`
2. I expect you to fail at this step, as you need to provide signing file path.
3. See the next step `Sign the app, publish on Google App Store`

------
Sign the app, publish on Google App Store
------
1. I have my .keystore in my User Doc folder, reuse that.
2. You should google this steps, as it will be varying from time to time.
3. In case you're being lazy
4. Create `simple_match_game\flutter_memory_matching_game\android\key.properties`
5. Put
```xml
storePassword=<password>
keyPassword=<password>
keyAlias=upload
storeFile=<path to .jsks file>
```

--------
Additional Info
--------
1. In case you wan t to change gradle version, do it at `simple_match_game\flutter_memory_matching_game\android\gradle\wrapper\gradle-wrapper.properties`
2. By running `./gradlew --version`, it will auto download & install gradle version specified, it will be put at `C:\Users\User\.gradle\wrapper\dists\`
- And this `./gradlew` files, will be created when you run `flutter build apk`
3. Change Target API version `minimumSdkVersion` & `maximum SdkVersion` at `simple_match_game\flutter_memory_matching_game\android\app\build.gradle`
4. Change app version `flutterVersionName and flutterVersionCode` at `simple_match_game\flutter_memory_matching_game\android\app\build.gradle`
- And also change `version`, by changing the number after `+`, at `simple_match_game\flutter_memory_matching_game\pubspec.yaml`
- eg: `1.0.0+1` to `1.0.0+2`
5. Flutter actually use JAVA specified in `D:\Program Files\Android\Android Studio\jre`
- You can run `flutter doctor -v` to see details (For some reason, when I do this command again, it didnt state Java path that it will search for, maybe only appear when Java and Gradle versions are incompatible?)