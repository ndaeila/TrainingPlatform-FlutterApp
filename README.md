# <name>APP

Training web/mobile app.

# Setup
## Flutter
**SDK-version** `v2.8.1`
MacOS: https://flutter.dev/docs/get-started/install/macos
Windows: https://flutter.dev/docs/get-started/install/windows

## Dart
**version** `2.15.1`

[Upgrading flutter](https://flutter.dev/docs/development/tools/sdk/upgrading)

## Flutter Library Install
* Use `flutter pub upgrade` basically
  * `flutter pub get` can't get newest library because of pubspec.lock

## Recommended VSCode extensions:
- Flutter
- Dart
- Bracket Pair Colorizer

## Mac Specific

1. Install [Homebrew](https://brew.sh/)
1. Install Ruby version manager which can handle .ruby-version e.g. [rbenv](https://github.com/rbenv/rbenv)
1. Install Ruby by Ruby version manager
1. Install Bundler `gem install bundler`
1. `bundle install --path vendor/bundle`
1. `cd ios`, `bundle exec fastlane match development`
    - Passphrase: (insert passphrase)
    - If you encountered an error, `bundle exec fastlane match nuke development` may resolve it.
1. `flutter pub run build_runner build`
1. `flutter build ios --no-codesign --simulator`
    - If you want to run the app on a device, run `flutter build ios --no-codesign`
1. `open ios/Runner.xcworkspace` and run the app
    - Alternatively, `open -a Simulator` and `flutter run`

# Deployment/Release
## Android
1. Run `flutter build apk --release` in the project console to build an apk file.
1. Upload the apk to google play, or Firebase app distribution depending on the need.

## iOS
https://www.google.com

## Getting Started

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Helpful to know
Typically, if there is a build error of some kind, run `flutter clean` then `flutter pub get`.

To generate the chopper and freeze files, run `flutter pub run build_runner build --delete-conflicting-outputs` in the terminal.