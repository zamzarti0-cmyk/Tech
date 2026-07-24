# Debug install workflow for Android

This project now builds and analyzes cleanly for a debug install on an Android phone.

## What was fixed

- Updated the Flutter dependency constraints in pubspec.yaml to match the current SDK.
- Replaced deprecated color usage in the health score card.
- Updated the theme code to use the current CardThemeData API.
- Removed the Google Fonts dependency from the app theme so the project stays compatible with the installed Flutter SDK.

## Prerequisites

1. Install Flutter SDK.
2. Install Android Studio and the Android SDK.
3. Enable Developer Options and USB debugging on your phone.
4. Connect the phone to your computer with a USB cable.
5. Accept the USB debugging prompt on the phone.

## Verify the device

```bash
adb devices
flutter devices
```

You should see your phone listed.

## Run the app in debug mode

From the project root:

```bash
./scripts/install_debug.sh
```

The script will:

- fetch dependencies
- analyze the app
- run the tests
- launch the app in debug mode on the connected device

If you want to target a specific device, run:

```bash
./scripts/install_debug.sh <device-id>
```
