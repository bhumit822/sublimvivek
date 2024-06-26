# sublime


## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/narvar-sublime/sublime-app.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

**Step 3:**

```
flutter run 
```

## TestFlight Release Builds

1. Increment the version number in `pubspec.yaml`
1. `flutter build ipa --release`
1. `open build/ios/archive/Runner.xcarchive`
   - validate the release
   - distribute the release to "TestFlight Internal Only"
