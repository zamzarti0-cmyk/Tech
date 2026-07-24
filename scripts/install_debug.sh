#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if ! command -v flutter >/dev/null 2>&1; then
  echo "Flutter SDK was not found on PATH."
  echo "Install Flutter and make sure 'flutter' is available before continuing."
  exit 1
fi

if [ -z "${ANDROID_HOME:-}" ] && [ -z "${ANDROID_SDK_ROOT:-}" ]; then
  echo "Android SDK not configured."
  echo "Set ANDROID_HOME or ANDROID_SDK_ROOT to your Android SDK path and try again."
  exit 1
fi

flutter pub get
flutter analyze
flutter test
flutter devices

DEVICE_ID="${1:-}"
if [ -n "$DEVICE_ID" ]; then
  flutter run --debug -d "$DEVICE_ID"
else
  flutter run --debug
fi
