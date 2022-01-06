# CaliforniaEfficiencyGroupAPP

This project is a training web app for California Efficiency Group.

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

## Getting Started

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Helpful to know
Typically, if there is a build error of some kind, run `flutter clean` then `flutter pub get`.

To generate the chopper and freeze files, run `flutter pub run build_runner build --delete-conflicting-outputs` in the terminal.