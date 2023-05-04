#!/usr/bin/env bash
set -e
flutter pub run build_runner build --delete-conflicting-outputs
flutter pub run easy_localization:generate -S assets/translations -O lib/core/generated/translations -f json -o codegen_loader.g.dart
flutter pub run easy_localization:generate -S assets/translations -O lib/core/generated/translations -f keys -o locale_keys.g.dart
