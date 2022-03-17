#!/bin/bash

pwd
flutter pub run build_runner clean
dart ./lib/generate_model.dart
flutter packages pub run build_runner build --delete-conflicting-outputs
#cd lib/json
#pwd
dart format ./lib/models/
#cd -
#pwd