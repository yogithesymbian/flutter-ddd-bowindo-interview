#!/bin/sh

fvm flutter pub run easy_localization:generate -S "assets/translations" -O "lib/gen"
fvm flutter pub run easy_localization:generate -S "assets/translations" -O "lib/gen" -o "locale_keys.g.dart" -f keys